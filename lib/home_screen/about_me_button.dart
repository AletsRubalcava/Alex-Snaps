import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutMeButton extends StatelessWidget{
  const AboutMeButton({required this.width, required this.height, super.key});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(20),
      child: Container(
        height: height * 0.07,
        width: double.infinity,
        color: Color(0xFF5D5D5D),
        child: Center(
          child: Text(
            'LEARN ABOUT ME',
            style: GoogleFonts.leagueGothic(
              color: Colors.white,
              fontSize: width * 0.08,
            ),
          ),
        ),
      ),
    );
  }
}