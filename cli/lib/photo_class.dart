import 'package:path/path.dart' as path;
import 'package:uuid/uuid.dart';

abstract class Picture {
  Picture({
    required this.id,
    required this.name,
    required this.route,
    required this.categories,
  });

  final String id;
  final String name;
  final String route;
  final List<String> categories;

  Map<String, dynamic> toJson();
}

class Thumbnail extends Picture {
  Thumbnail({
    required super.id,
    required super.name,
    required super.route,
    required super.categories,
  });

  factory Thumbnail.createID(
    String originalImageName,
  ) {
    final uuid = Uuid();

    final id = uuid.v4();
    late final String thumbName;
    if(originalImageName.startsWith('thumb_')){
        thumbName = originalImageName;
    }else{
       thumbName = 'thumb_$originalImageName';
    }
    final route = path.join('app', 'assets', 'images','thumbs', thumbName);
    return Thumbnail(id: id, name: thumbName, route: route, categories: []);
  }

  factory Thumbnail.decode(dynamic thumb){
        final thumbId = thumb['id'] as String;
        final name = thumb['name'] as String;
        final newRoute = path.join('app','assets','images','thumbs',name);
        //To every element in categories, converts it into the expected type
        final photoCategories = (thumb['categories'] as List<dynamic>)
            .map((cat) => cat.toString())
            .toList(); //Returns an iterable, converts it into a list

        final thumbObj = Thumbnail(
          id: thumbId,
          route: newRoute,
          name: name,
          categories: photoCategories,
        );
        return thumbObj;
  }

  @override
  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'route': route, 'categories': categories};
  }
}

class Photo extends Picture {
  Photo({
    required super.id,
    required this.order,
    required super.name,
    required super.route,
    required super.categories,
  });

  int order;

  factory Photo.createID(String imageName, int photoOrder) {
    final uuid = Uuid();

    final id = uuid.v4();
    final route = path.join('app', 'assets', 'images', imageName);
    return Photo(
      id: id,
      order: photoOrder,
      name: imageName,
      route: route,
      categories: [],
    );
  }

  factory Photo.decode(Map<String,dynamic> photo){
        final photoId = photo['id'] as String;
        final order = photo['order'] as int;
        final name = photo['name'] as String;
        final newRoute = path.join('app','assets','images',name);
        //To every element in categories, converts it into the expected type
        final photoCategories = (photo['categories'] as List<dynamic>)
            .map((cat) => cat.toString())
            .toList(); //Returns an iterable, converts it into a list

        final photoObj = Photo(
          id: photoId,
          order: order,
          route: newRoute,
          name: name,
          categories: photoCategories,
        );
        return photoObj;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'order': order,
      'name': name,
      'route': route,
      'categories': categories,
    };
  }
}
