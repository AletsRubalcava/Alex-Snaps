import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ClosedFilterSearchButton extends StatelessWidget {
  const ClosedFilterSearchButton({
    required this.text,
    required this.aspectRatio,
    super.key,
  });

  final String text;
  final double aspectRatio;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(10),
      child: AspectRatio(
        aspectRatio: aspectRatio,
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
