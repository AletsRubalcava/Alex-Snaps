import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GalleryPage extends StatelessWidget{
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightGreenAccent,
      child: Center(
        child: Text(
          'GALLERY',
          style: GoogleFonts.leagueGothic(color: Colors.white, fontSize: 60),
        ),
      ),
    );
  }
}