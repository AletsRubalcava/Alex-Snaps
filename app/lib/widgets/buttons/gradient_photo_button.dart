import 'package:alex_snaps/gallery/photo_gallery_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GradientPhotoButton extends StatelessWidget {
  const GradientPhotoButton({
    required this.photo,
    required this.text,
    this.category,
    super.key,
  });

  final String photo;
  final String text;
  final String? category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (_, _, _) => GalleryPhotoPage(text: text, category: category),
            transitionDuration: const Duration(milliseconds: 0),
            reverseTransitionDuration: const Duration(milliseconds: 0)
          )
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(20),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                photo,
                fit: BoxFit.cover,
                cacheWidth: 1100,
                cacheHeight: 1425,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: FractionallySizedBox(
                heightFactor: 0.4,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Theme.of(context).primaryColor.withAlpha(128),
                        Theme.of(context).primaryColor,
                      ],
                      stops: [0.0, 0.75, 1],
                    ),
                  ),
                ),
              ),
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                final w = constraints.maxWidth;
                final h = constraints.maxHeight;
                final wider = constraints.maxWidth >= constraints.maxHeight;

                Alignment alignment;
                double leftPadding;

                if (wider) {
                  alignment = Alignment.bottomLeft;
                  leftPadding = w * 0.08;
                } else {
                  alignment = Alignment.bottomCenter;
                  leftPadding = 0;
                }

                return Align(
                  alignment: alignment,
                  child: Padding(
                    padding: EdgeInsetsGeometry.only(
                      left: leftPadding,
                      top: h * 0.70,
                    ),
                    child: Text(
                      text,
                      style: GoogleFonts.leagueGothic(
                        fontSize: w * 0.18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
