import 'package:uuid/uuid.dart';

class Category{
  final String id;
  final String name;
  final String thumbId;

  Category({required this.id, required this.name, required this.thumbId});

  factory Category.createId(String name, String thumbId){
    final uuid = Uuid();
    final id = uuid.v4();
    return Category(id: id, name: name, thumbId: thumbId);
  }

  factory Category.decode(Map<String,dynamic> cat){
    final catId = cat['id'] as String;
    final name = cat['name'] as String;
    final thumbId = cat['thumb'] as String;

    final catObj = Category(
      id: catId,
      name: name,
      thumbId: thumbId
    );
    return catObj;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'thumb': thumbId
    };
  }
}