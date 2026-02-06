import 'dart:io';
import 'dart:convert';
import 'package:cli/photo_class.dart';

class Database {

  final file = File('${Directory.current.path}/../data/app_data.json');
  final List<String> categories = [];
  final List<Photo> photos = [];

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
    final photoList = data['photos'] as List<dynamic>;
    //Turns every element of the list, and turns it into a string.
    categories.addAll(categoryList.map((category) => category.toString()));
    photos.addAll(photoList.map((photo){
        final id = photo['id'] as String;
        final name = photo['name'] as String;
        final route = photo['route'] as String;
        return Photo(id: id, route: route, name: name);
        })
    );
  }

  bool lookForCategory(String target) {
    //O(n). Could be O(1), but not necessary right now.
    return categories.contains(target);
  }

  void addCategory(String category) {
    categories.add(category);
  }

  void removeCategory(String category){
    categories.remove(category);
  }

  void addPhoto(Photo photo){
    photos.add(photo);
  }

  void writeDatabaseFile(){

    final data = {
      'categories': categories,
      'photos': photos.map((photo) => photo.toJson()).toList()
    };

    //Converts data into json format with auto indentation
    final content = JsonEncoder.withIndent('\t').convert(data);

    //Writes content in the json file
    file.writeAsStringSync(content);
  }

  List<String> getCategories() {
    return categories;
  }
}
