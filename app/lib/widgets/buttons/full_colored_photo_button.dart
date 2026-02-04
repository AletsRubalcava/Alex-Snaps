import 'package:alex_snaps/app_content/strings.dart';
import 'package:flutter/material.dart';
import 'package:alex_snaps/app_content/assets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:alex_snaps/gallery/gallery_photo_page.dart';

class FullColoredPhotoButton extends StatelessWidget {
  const FullColoredPhotoButton({required this.text, super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (_, _, _) => GalleryPhotoPage(),
            transitionDuration: const Duration(milliseconds: 0),
            reverseTransitionDuration: Duration(milliseconds: 200),
            transitionsBuilder: (_,animation,_,child){
              final offset = Tween(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation);

              return SlideTransition(
                position: offset,
                child: child,
              );
            }
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(20),
        child: AspectRatio(
          aspectRatio: 2,
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  Assets.images.mainGalleryButton,
                  fit: BoxFit.cover,
                ),
              ),
              Container(color: Theme.of(context).primaryColor.withAlpha(102)),
              Center(
                child: Text(
                  Strings.mainGalleryButton,
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
