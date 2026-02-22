import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:alex_snaps/gallery/photo_gallery_page.dart';

class FullColoredPhotoButton extends StatelessWidget {
  const FullColoredPhotoButton({
    required this.text,
    required this.photo,
    this.category,
    super.key,
  });

  final String text;
  final String photo;
  final String? category;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (_, _, _) => GalleryPhotoPage(category: category, text: text),
            transitionDuration: const Duration(milliseconds: 0),
            reverseTransitionDuration: Duration(milliseconds: 0),
            transitionsBuilder: (_, animation, _, child) {
              final offset = Tween(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation);

              return SlideTransition(position: offset, child: child);
            },
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(20),
        child: AspectRatio(
          aspectRatio: 2,
          child: Stack(
            children: [
              Positioned.fill(child: Image.asset(photo, fit: BoxFit.cover)),
              Container(color: Theme.of(context).primaryColor.withAlpha(102)),
              Center(
                child: Text(
                  text,
                  style: GoogleFonts.leagueGothic(
                    color: Colors.white,
                    fontSize: width * 0.1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
