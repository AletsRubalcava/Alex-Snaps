import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutMePage extends StatelessWidget{
  const AboutMePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.orange,
      child: Center(
        child: Text(
          'ABOUT ME',
          style: GoogleFonts.leagueGothic(color: Colors.white, fontSize: 60),
        ),
      ),
    );
  }
}