import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleText extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  const TitleText({
    required this.text,
    this.fontSize,
    this.paddingTop,
    this.paddingBottom,
    this.textHeight,
    super.key,
  });

  final String text;
  final double? fontSize;
  final double? paddingTop;
  final double? paddingBottom;
  final double? textHeight;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final calculatedFonsSize = fontSize ?? width * 0.10;
    final calculatedPaddingTop = paddingTop ?? height * 0.005;
    final calculatedPaddingBottom = paddingBottom ?? 0;


    return Padding(
      padding: EdgeInsetsGeometry.only(top: calculatedPaddingTop, bottom: calculatedPaddingBottom),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: GoogleFonts.leagueGothic(
            color: Colors.white,
            fontSize: calculatedFonsSize,
            height: textHeight,
          ),
        ),
      ),
    );
  }
}
