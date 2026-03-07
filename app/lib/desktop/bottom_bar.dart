import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({required this.height, super.key});

  final double height;

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;

    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Color(0xFF2D2D2D),
        boxShadow: [
          BoxShadow(
            color: Colors.black54.withAlpha(128),
            spreadRadius: 5,
            blurRadius: 7,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: height * 0.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if(width > 900 ) Text(
            '© ALEX SNAPS VISUALS',
            style: GoogleFonts.leagueGothic(
              fontSize: height * 0.3,
              color: Color(0xFF6F6F6F),
              height: 1,
            ),
          ),
          Text(
            '@ALEXSNAPS.JPG',
            style: GoogleFonts.leagueGothic(
              fontSize: height * 0.3,
              color: Color(0xFF6F6F6F),
              height: 1,
            ),
          ),
          Text(
            'CAPTURING THE UNSEEN THREADS OF TIME',
            style: GoogleFonts.leagueGothic(
              fontSize: height * 0.3,
              color: Color(0xFF6F6F6F),
              height: 1,
            ),
          ),
        ],
      ),
    )
    );
  }
}
