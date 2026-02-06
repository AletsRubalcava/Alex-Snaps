class Photo {
  Photo({
    required this.id,
    required this.route,
    required this.name,
    required this.categories,
  });

  final String id;
  final String name;
  final String route;
  final List<String> categories;

  factory Photo.createID(String arg) {
    final id = DateTime.now().millisecondsSinceEpoch.toString();
    final name = arg;
    final route = 'assets/images/$arg';
    final List<String> categories = [];

    return Photo(id: id, name: name, route: route, categories: categories);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'route': route, 'categories': categories};
  }
}
