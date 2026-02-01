import 'package:alex_snaps/app_content/strings.dart';
import 'package:flutter/material.dart';
import 'package:alex_snaps/app_content/assets.dart';
import 'package:google_fonts/google_fonts.dart';

class FullColoredPhotoButton extends StatelessWidget {
  const FullColoredPhotoButton({
    required this.text,
    required this.width,
    required this.height,
    super.key,
  });

  final String text;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
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
    );
  }
}
