import 'package:path/path.dart' as path;
import 'package:uuid/uuid.dart';

class Photo {
  Photo({
    required this.id,
    required this.order,
    required this.route,
    required this.name,
    required this.categories,
  });

  final String id;
  final int order;
  final String name;
  final String route;
  final List<String> categories;

  factory Photo.createID(String arg, int photoOrder, bool thumb) {
    final uuid = Uuid();

    final id = uuid.v4();
    final order = photoOrder;
    String name = arg;
    String route = path.join('app','assets','images',arg);
    final List<String> categories = [];

    if(thumb) {
      name = 'thumb_$arg';
      route = path.join('app','assets','images','thumbs','thumb_$arg');
    }

    return Photo(id: id, order: order, name: name, route: route, categories: categories);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'order': order, 'name': name, 'route': route, 'categories': categories};
  }
}
