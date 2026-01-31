import 'landing_page.dart';
import 'package:flutter/material.dart';
import 'package:alex_snaps/home_screen/home_screen.dart';

class ScrollVertical extends StatelessWidget {
  ScrollVertical({super.key});

  final PageController _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      children: [
        LandingPage(),
        HomeScreen()
      ],
    );
  }
}