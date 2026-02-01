import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FilterSearchButton extends StatelessWidget {
  const FilterSearchButton({
    required this.width,
    required this.text,
    super.key,
  });

  final double width;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(10),
      child: AspectRatio(
        aspectRatio: 8,
        child: Container(
          color: Color(0xFF343434),
          child: Center(
            child: Text(
              text,
              style: GoogleFonts.leagueGothic(
                color: Color(0xFF626262),
                fontSize: width * 0.07,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
