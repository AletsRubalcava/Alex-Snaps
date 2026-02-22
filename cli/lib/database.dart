import 'dart:io';
import 'dart:convert';
import 'package:shared/photo_class.dart';
import 'package:shared/category_class.dart';
import 'package:path/path.dart' as path;

class Database {
  final projectRoot = path.dirname(Directory.current.path);

  late final imageDir = Directory(
    path.join(projectRoot, 'app', 'assets', 'images'),
  );
  late final thumbDir = Directory(path.join(imageDir.path, 'thumbs'));
  late final dataFile = File(
    path.join(projectRoot, 'cli', 'data', 'app_data.json'),
  );

  final Map<String, Category> categories = {};
  final Map<String, Photo> photos = {};
  final Map<String, Thumbnail> thumbs = {};
  final Map<String, String> photoFileNameMap = {};
  final Map<String, String> thumbFileNameMap = {};
  final Map<int, String> orderMap = {};
  int maxOrder = 0;

  void load() {
    lookForEssentialDirectories();
    fillDatabase();
  }

  void lookForEssentialDirectories() {
    final directories = [
      path.join('cli', 'data', 'import'),
      path.join('app', 'assets', 'icons'),
      path.join('app', 'assets', 'images', 'thumbs'),
    ];

    for (final dir in directories) {
      final directory = Directory(path.join(projectRoot, dir));
      if (!directory.existsSync()) {
        _repairDirectory(dir);
      }
    }
  }

  void _repairDirectory(String directory) {
    final dir = Directory(path.join(projectRoot, directory));
    print('Creating missing directory: $directory');
    dir.createSync(recursive: true);
  }

  void fillDatabase() {
    //If file doesn't exist
    if (!dataFile.existsSync()) {
      dataFile.createSync();
      save();
      return;
    }

    //Converts the JSON into a string
    final content = dataFile.readAsStringSync();

    Map<String, dynamic> data;
    //Verify json is valid or not corrupted.
    try {
      //Decodes the content as a map of type string an dynamic
      data = jsonDecode(content) as Map<String, dynamic>;
    } catch (_) {
      print('Corrupted database file, recreating file.');
      save();
      return;
    }

    //If json is empty
    if (content.trim().isEmpty) {
      save();
      return;
    }

    //Extract map 'data' in 'categories and photos as a list of type dynamic
    final categoryJson = (data['categories'] as Map<String, dynamic>?) ?? {};
    categories.clear();
    //Creates a map from a set of map entries
    categories.addAll(
      categoryJson.map((id, categoryData) {
        return MapEntry(id, Category.decode(categoryData as Map<String, dynamic>));
      }),
    );

    final photosJson = (data['photos'] as Map<String, dynamic>?) ?? {};
    photos.clear();
    //Creates a map from a set of map entries
    photos.addAll(
      photosJson.map((id, photoData) {
        return MapEntry(id, Photo.decode(photoData as Map<String, dynamic>));
      }),
    );

    final thumbsJson = (data['thumbs'] as Map<String, dynamic>?) ?? {};
    thumbs.clear();
    thumbs.addAll(
      thumbsJson.map((id, thumbData) {
        return MapEntry(
          id,
          Thumbnail.decode(thumbData as Map<String, dynamic>),
        );
      }),
    );

    final dataOrder = data['max order'] as int?;
    maxOrder = dataOrder ?? 0;

    updateFileNameMap();
    updateMaxOrderFileMap();
  }

  File? lookForFile(String fileName, String dir) {
    final directory = Directory(path.join(projectRoot, dir));
    final imageFiles = directory.listSync().whereType<File>();

    for (final file in imageFiles) {
      final name = file.uri.pathSegments.last;
      if (name == fileName) {
        return file;
      }
    }
    return null;
  }

  List<String> validateCategories(List<String> cats) {
    final valid = <String>[];
    final invalid = <String>[];

    for (final cat in cats) {
      if (categories[cat] != null) {
        valid.add(cat);
      } else {
        invalid.add(cat);
      }
    }
    if (invalid.isNotEmpty) {
      print('These categories does not exist: ${invalid.join(', ')}');
    }
    return valid;
  }

  String? addCategory(String categoryName, String thumbName) {
    if (categories[categoryName] != null) {
      print('Category: "$categoryName" already exist.');
      return null;
    }
    final thumbId = thumbFileNameMap[thumbName];

    if (thumbId == null) {
      print('Thumb: "$thumbName" does not exist.');
      return null;
    }
    final cat = Category.createId(categoryName, thumbId);
    categories[cat.id] = cat;
    return cat.id;
  }

  void removeCategory(String category) {
    categories.remove(category);
  }

  Map<String, Category> getCategories() {
    return categories;
  }

  void updateFileNameMap() {
    photoFileNameMap
      ..clear()
      ..addEntries(photos.values.map((p) => MapEntry(p.name, p.id)));
    thumbFileNameMap
      ..clear()
      ..addEntries(thumbs.values.map((p) => MapEntry(p.name, p.id)));
  }

  void updateMaxOrderFileMap() {
    orderMap
      ..clear()
      ..addEntries(photos.values.map((p) => MapEntry(p.order, p.id)));
    maxOrder = orderMap.length;
  }

  String addPhoto(File file, bool thumb) {
    final fileName = file.uri.pathSegments.last;

    final dynamic picture;

    if (thumb) {
      picture = Thumbnail.createID(fileName);
      thumbs[picture.id] = picture;
    } else {
      picture = Photo.createID(fileName, maxOrder + 1);
      photos[picture.id] = picture;
    }
    movePhoto(file.path, picture.route);
    return picture.id;
  }

  void movePhoto(String fileRoute, String destinyPath) {
    final file = File(fileRoute);
    destinyPath = path.join('app', destinyPath);
    final finalPath = path.isAbsolute(destinyPath)
        ? destinyPath
        : path.join(projectRoot, destinyPath);
    try {
      file.rename(finalPath);
    } catch (_) {
      file.copySync(finalPath);
      file.deleteSync();
    }
  }

  void removePhoto(String id, bool thumb) {
    final Picture? photo;

    if(thumb){
      photo = thumbs[id];
    }else{
      photo = photos[id];
    }

    if (photo == null) {
      final msg = thumb ? 'thumb' : 'photo';
      print('Photo not found as a $msg.');
      return;
    }
    final File? file = lookForFile(photo.name,path.dirname(path.join('app',photo.route)));

    thumb ? thumbs.remove(id) : photos.remove(id);

    if (file == null) return;
    file.deleteSync();
    print('Photo deleted successfully!');
  }

  void addCategoryToPhoto(String id, String category, bool thumb) {
    final Picture? picture;

    if (thumb) {
      picture = thumbs[id];
    } else {
      picture = photos[id];
    }
    if (picture == null) return;

    if (!picture.categories.contains(category)) {
      picture.categories.add(category);
    }
  }

  void removeCategoryToPhoto(String id, String category) {
    final photo = photos[id];
    if (photo == null) return;

    if (!photo.categories.contains(category)) {
      print('$category not present in ${photo.name}');
      return;
    }
    photo.categories.remove(category);
    return;
  }

  void save() {
    final data = {
      'categories': categories.map(
        (id, category) => MapEntry(id, category.toJson()),
      ),
      'photos': photos.map((id, photo) => MapEntry(id, photo.toJson())),
      'thumbs': thumbs.map((id, photo) => MapEntry(id, photo.toJson())),
      'max order': maxOrder,
    };
    //Converts data into json format with auto indentation
    final content = JsonEncoder.withIndent('\t').convert(data);
    //Writes content in the json file
    dataFile.writeAsStringSync(content);

    updateFileNameMap();
    updateMaxOrderFileMap();
  }
}
