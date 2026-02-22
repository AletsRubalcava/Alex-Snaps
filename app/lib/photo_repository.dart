import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:shared/photo_class.dart';

class PhotoRepository {
  final Set<String> categories = {};
  final Map<String, Photo> photos = {};
  final Map<String, Thumbnail> thumbs = {};

  Future<void> load() async {
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