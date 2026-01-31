import 'package:flutter/material.dart';
import 'package:alex_snaps/home_screen/home_layout.dart';
import 'package:google_fonts/google_fonts.dart';

class HorizontalScroll extends StatelessWidget {
  HorizontalScroll({super.key});
  final PageController _controller = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      scrollDirection: Axis.horizontal,
      children: pages,
    );
  }

  final List<Widget> pages = [
    Card(
      color: Colors.lightGreenAccent,
      child: Center(
        child: Text(
          'GALLERY',
          style: GoogleFonts.leagueGothic(color: Colors.white, fontSize: 60),
        ),
      ),
    ),
    HomeLayout(),
    Card(
      color: Colors.orange,
      child: Center(
        child: Text(
          'ABOUT ME',
          style: GoogleFonts.leagueGothic(color: Colors.white, fontSize: 60),
        ),
      ),
    ),
  ];
}
