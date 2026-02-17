import 'dart:io';
import 'dart:convert';
import 'package:cli/photo_class.dart';
import 'package:path/path.dart' as path;

class Database {
  final projectRoot = path.dirname(Directory.current.path);

  late final imageDir = Directory(path.join(projectRoot,'app','assets','images'));
  late final thumbDir = Directory(path.join(imageDir.path,'thumbs'));
  late final dataFile = File(path.join(projectRoot, 'data', 'app_data.json'));

  final Set<String> categories = {};
  final Map<String, Photo> photos = {};
  final Map<String, Thumbnail> thumbs = {};
  final Map<String, String> fileNameMap = {};
  final Map<int, String> orderMap = {};
  int maxOrder = 0;

  void load() {
    lookForEssentialDirectories();
    fillDatabase();
  }

  void lookForEssentialDirectories() {
    final directories = [
      'data/import',
      'app/assets/icons',
      'app/assets/images/thumbs',
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
    final categoryList = (data['categories'] as List<dynamic>?) ?? [];
    categories.clear();
    //Turns every element of the list, and turns it into a string.
    categories.addAll(categoryList.map((category) => category.toString()));

    final photosJson = (data['photos'] as Map<String, dynamic>?) ?? {};
    photos.clear();
    //Creates a map from a set of map entries
    photos.addAll(
        photosJson.map((id,photoData){
          return MapEntry(id, Photo.decode(photoData as Map<String,dynamic>));
        })
    );

    final thumbsJson = (data['thumbs'] as Map<String, dynamic>?) ?? {};
    thumbs.clear();
    thumbs.addAll(
        thumbsJson.map((id,thumbData){
        return MapEntry(id, Thumbnail.decode(thumbData as Map<String,dynamic>));
      })
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
      if (categories.contains(cat)) {
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

  void addCategory(String category) {
    categories.add(category);
  }

  void removeCategory(String category) {
    categories.remove(category);
  }

  Set<String> getCategories() {
    return categories;
  }

  void updateFileNameMap() {
    fileNameMap
      ..clear()
      ..addEntries(photos.values.map((p) => MapEntry(p.name, p.id)))
      ..addEntries(thumbs.values.map((p) => MapEntry(p.name, p.id)));
  }

  void updateMaxOrderFileMap(){
    orderMap
      ..clear()
      ..addEntries(photos.values.map((p) => MapEntry(p.order, p.id)));
    maxOrder = orderMap.length;
  }

  String addPhoto(File file, bool thumb) {
    final fileName = file.uri.pathSegments.last;

    // ignore: prefer_typing_uninitialized_variables
    late final picture;

    if(thumb){
      picture = Thumbnail.createID(fileName);
      thumbs[picture.id] = picture;
    }else{
      picture = Photo.createID(fileName, maxOrder + 1);
      photos[picture.id] = picture;
    }
    movePhoto(file.path, picture.route);
    return picture.id;
  }

  void movePhoto(String fileRoute, String destinyPath) {
    final file = File(fileRoute);
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

  void removePhoto(String id) {
    final photo = photos[id];
    if (photo == null) return;

    final File? file = lookForFile(photo.name, path.dirname(photo.route));
    photos.remove(id);

    if (file == null) return;
    file.deleteSync();
  }

  void addCategoryToPhoto(String id, String category) {
    final photo = photos[id];
    if (photo == null) return;

    if(!photo.categories.contains(category)) {
      photo.categories.add(category);
    }
  }

  void removeCategoryToPhoto(String id, String category) {
    final photo = photos[id];
    if(photo == null) return;

    if(!photo.categories.contains(category)) {
      print('$category not present in ${photo.name}');
      return;
    }
    photo.categories.remove(category);
    return;
  }

  void save() {
    final data = {
      'categories': categories.toList(),
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
