import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:shared/photo_class.dart';

class PhotoRepository {
  final Set<String> categories = {};
  final Map<String, Photo> photos = {};
  final Map<String, Thumbnail> thumbs = {};

  late final dataFile = File(
    path.join('app', 'assets', 'read_only_app_data.json'),
  );

  void load() {
    lookForEssentialDirectories();
    fillRepository();
  }

  void lookForEssentialDirectories() {
    final directories = [
      path.join('app', 'assets', 'icons'),
      path.join('app', 'assets', 'images', 'thumbs'),
    ];

    for (final dir in directories) {
      final directory = Directory(path.join(dir));
      if (!directory.existsSync()) {
        _repairDirectory(dir);
      }
    }
  }

  void _repairDirectory(String directory) {
    final dir = Directory(path.join(directory));
    dir.createSync(recursive: true);
  }

  void fillRepository() {
    if (!dataFile.existsSync()) {
      dataFile.createSync();
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
      return;
    }

    //If json is empty
    if (content.trim().isEmpty) {
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
  }
}
