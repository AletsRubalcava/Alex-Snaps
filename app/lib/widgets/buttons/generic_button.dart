import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GenericButton extends StatelessWidget {
  const GenericButton(
    this.text, {
    this.onTap,
    this.textColor,
    this.fontSize,
    this.width,
    super.key,
  });

  final String text;
  final VoidCallback? onTap;
  final Color? textColor;
  final double? fontSize;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final colorText = textColor ?? Colors.white;
    final sizeText = fontSize ?? 20;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: GoogleFonts.leagueGothic(color: colorText, fontSize: sizeText),
        ),
      ),
    );
  }
}
