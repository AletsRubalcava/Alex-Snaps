import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleText extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  TitleText({
    required this.text,
    this.fontSize,
    this.paddingTop,
    this.paddingBottom,
    this.textHeight,
    super.key,
  });

  final String text;
  double? fontSize;
  double? paddingTop;
  double? paddingBottom;
  double? textHeight;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    fontSize ??= width * 0.10;
    paddingTop ??= height * 0.005;
    paddingBottom ??= 0;
    textHeight ??= null;


    return Padding(
      padding: EdgeInsetsGeometry.only(top: paddingTop!, bottom: paddingBottom!),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: GoogleFonts.leagueGothic(
            color: Colors.white,
            fontSize: fontSize,
            height: textHeight,
          ),
        ),
      ),
    );
  }
}
