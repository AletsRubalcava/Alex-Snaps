import 'package:flutter/cupertino.dart';

class PhotoDisplay extends StatelessWidget{
  const PhotoDisplay({required this.photo,super.key});

  final String photo;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadiusGeometry.circular(5),
        image: DecorationImage(image: AssetImage(photo), fit: BoxFit.cover),
      ),
    );
  }
}