import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutMeButton extends StatelessWidget {
  const AboutMeButton({
    required this.width,
    required this.height,
    required this.onNavigate,
    super.key,
  });

  final double width;
  final double height;

  final Function(int) onNavigate;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onNavigate(2),
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(20),
        child: Container(
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
      ),
    );
  }
}
