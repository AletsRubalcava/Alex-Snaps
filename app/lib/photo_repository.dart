import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:shared/photo_class.dart';
import 'package:shared/category_class.dart';

class PhotoRepository {
  final Map<String,Category> categories = {};
  final Map<String, Photo> photos = {};
  final Map<String, Thumbnail> thumbs = {};

  Future<void> load() async {
    //Looks for the file in the rootBundle (flutter files)
    final content = await rootBundle.loadString('assets/read_only_app_data.json');

    Map<String, dynamic> data;
    //Verify json is valid or not corrupted.
    try {
      //Decodes the content as a map of type string an dynamic
      data = jsonDecode(content) as Map<String, dynamic>;
    } catch (_) {
      return;
    }

    //If json is empty
    //Trim deletes spaces before and after the document.
    if (content.trim().isEmpty) {
      return;
    }

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
  }
}