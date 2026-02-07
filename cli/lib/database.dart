import 'dart:io';
import 'dart:convert';
import 'package:cli/photo_class.dart';
import 'package:path/path.dart' as path;

class Database {
  final projectRoot = path.dirname(Directory.current.path);
  late final dataFile = File(path.join(projectRoot,'data','app_data.json'));
  final List<String> categories = [];
  final Map<String, Photo> photos = {};

  void initialize(){
    lookForEssentialDirectories();
    fillDatabase();
  }

  void lookForEssentialDirectories(){
    final directories = [
      'data/import',
      'app/assets/icons',
      'app/assets/images/thumbs'
    ];

    for(final dir in directories){
      final directory = Directory(path.join(projectRoot,dir));
      if(!directory.existsSync()){
        _repairDirectory(dir);
      }
    }
  }

  void _repairDirectory(String directory){
    final dir = Directory(path.join(projectRoot,directory));
    print('Creating missing directory: $directory');
    dir.createSync(recursive: true);
  }

  void fillDatabase() {
    //If file doesn't exist
    if (!dataFile.existsSync()) {
      dataFile.createSync();
      writeDatabaseFile();
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
      writeDatabaseFile();
      return;
    }

    //If json is empty
    if(content.trim().isEmpty){
      writeDatabaseFile();
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
      photosJson.map((id, photoData) {
        final photoMap = photoData as Map<String, dynamic>;

        final photoId = photoMap['id'] as String;
        final name = photoMap['name'] as String;
        final route = photoMap['route'] as String;
        //To every element in categories, converts it into the expected type
        final photoCategories = (photoMap['categories'] as List<dynamic>)
            .map((cat) => cat.toString())
            .toList(); //Returns an iterable, converts it into a list

        final photoObj = Photo(
          id: photoId,
          route: route,
          name: name,
          categories: photoCategories,
        );
        return MapEntry(id, photoObj);
      }),
    );
  }

  bool lookForCategory(String target) {
    //O(n). Could be O(1), but not necessary right now.
    return categories.contains(target);
  }

  void addCategory(String category) {
    categories.add(category);
  }

  void removeCategory(String category) {
    categories.remove(category);
  }

  List<String> getCategories() {
    return categories;
  }

  String lookForPhotoByName(String name){
    final photo = photos.values.where((p) => p.name == name).first;
    return photo.id;
  }

  void addPhoto(Photo photo) {
    photos[photo.id] = photo;
  }

  void removePhoto(String id){
    photos.remove(id);
  }

  void addCategoryToPhoto(String id, String category) {
    photos[id]!.categories.add(category);
  }

  void removeCategoryToPhoto(String id, String category){
    photos[id]!.categories.remove(category);
  }

  void writeDatabaseFile() {
    final data = {
      'categories': categories,
      'photos': photos.map((id, photo) => MapEntry(id, photo.toJson())),
    };
    //Converts data into json format with auto indentation
    final content = JsonEncoder.withIndent('\t').convert(data);
    //Writes content in the json file
    dataFile.writeAsStringSync(content);
  }
}
