import 'package:path/path.dart' as path;

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

  factory Photo.createID(String arg, int photoOrder) {
    final id = DateTime.now().millisecondsSinceEpoch.toString();
    final order = photoOrder;
    final name = arg;
    final route = path.join('app','assets','images',arg);
    final List<String> categories = [];

    return Photo(id: id, order: order, name: name, route: route, categories: categories);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'order': order, 'name': name, 'route': route, 'categories': categories};
  }
}
