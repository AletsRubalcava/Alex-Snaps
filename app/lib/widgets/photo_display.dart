import 'package:alex_snaps/widgets/show_image_dialog.dart';
import 'package:flutter/material.dart';

class PhotoDisplay extends StatelessWidget{
  const PhotoDisplay({required this.photo,super.key});

  final String photo;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;

    // Calculamos el tamaño aproximado de la celda en la grid (3 columnas)
    // Pantalla - (padding 8% * 2) / 3 columnas
    final cacheWidth = ((width * 0.84) / 3 * devicePixelRatio * 0.5).round();

    return GestureDetector(
      onTap: () {
        showImageDialog(context, photo);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          image: DecorationImage(
            image: ResizeImage(
              AssetImage(photo),
              width: cacheWidth,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
