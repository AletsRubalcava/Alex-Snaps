import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeTitle extends StatelessWidget{
  const HomeTitle({required this.width, required this.height, super.key});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.only(top: height * 0.005),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'HOME',
          style: GoogleFonts.leagueGothic(
            color: Colors.white,
            fontSize: width * 0.10,
          ),
        ),
      ),
    );
  }
}