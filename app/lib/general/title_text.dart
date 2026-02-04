import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleText extends StatelessWidget{
  const TitleText({required this.text, super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsetsGeometry.only(top: height * 0.005),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: GoogleFonts.leagueGothic(
            color: Colors.white,
            fontSize: width * 0.10,
          ),
        ),
      ),
    );
  }
}