import 'dart:io';
import 'dart:convert';
import 'package:cli/photo_class.dart';

class Database {
  final file = File('${Directory.current.path}/../data/app_data.json');
  final List<String> categories = [];
  final Map<String, Photo> photos = {};

  void fillCategories() {
    //If file doesn't exist
    if (!file.existsSync()) {
      print('File: ${file.uri.pathSegments.last} does not exist.');
      exit(1);
    }
    //Converts the JSON into a string
    final content = file.readAsStringSync();
    //Decodes the content as a map of type string an dynamic
    final data = jsonDecode(content) as Map<String, dynamic>;
    //Extract map 'data' in 'categories and photos as a list of type dynamic
    final categoryList = data['categories'] as List<dynamic>;
    final photosJson = data['photos'] as Map<String, dynamic>;
    //Turns every element of the list, and turns it into a string.
    categories.addAll(categoryList.map((category) => category.toString()));
    //Creates a map from a set of map entries
    photos.addAll(
      photosJson.map((id, photoData) {
        final photoMap = photoData as Map<String, dynamic>;

        final photoId = photoMap['id'] as String;
        final name = photoMap['name'] as String;
        final route = photoMap['route'] as String;
        //To every element in categories, converts it into the expected type
        final categories = (photoMap['categories'] as List<dynamic>)
            .map((cat) => cat.toString())
            .toList(); //Returns an iterable, converts it into a list

        final photoObj = Photo(
          id: photoId,
          route: route,
          name: name,
          categories: categories,
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

  void writeDatabaseFile() {
    final data = {
      'categories': categories,
      'photos': photos.map((id, photo) => MapEntry(id, photo.toJson())),
    };

    //Converts data into json format with auto indentation
    final content = JsonEncoder.withIndent('\t').convert(data);

    //Writes content in the json file
    file.writeAsStringSync(content);
  }

  List<String> getCategories() {
    return categories;
  }

  void addCategoryToPhoto(String id, String category) {
    photos[id]!.categories.add(category);
  }

  void removeCategoryToPhoto(String id, String category){
    photos[id]!.categories.remove(category);
  }
}
