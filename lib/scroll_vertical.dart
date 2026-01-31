import 'package:alex_snaps/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:alex_snaps/home_screen.dart';

class ScrollVertical extends StatelessWidget{
  ScrollVertical({super.key});
  final PageController _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        scrollDirection: Axis.vertical,
        children: pages,
      ),
    );
  }
  final List<Widget> pages = [
    LandingPage(),
    HomeScreen()
  ];
}