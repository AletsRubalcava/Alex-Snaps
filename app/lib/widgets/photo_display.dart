import 'package:alex_snaps/widgets/show_image_dialog.dart';
import 'package:flutter/cupertino.dart';

class PhotoDisplay extends StatelessWidget{
  const PhotoDisplay({required this.photo,super.key});

  final String photo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        showImageDialog(context, photo);
      },
      child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadiusGeometry.circular(5),
        image: DecorationImage(image: AssetImage(photo), fit: BoxFit.cover),
      ),
      )
    );
  }
}