import 'package:alex_snaps/general/bottom_navigation_bar.dart';
import 'package:alex_snaps/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:alex_snaps/about_me/about_me_page.dart';
import 'package:alex_snaps/gallery/gallery_page.dart';

class HorizontalScroll extends StatefulWidget {
  const HorizontalScroll({required this.onPageChanged, super.key});

  //Saves the void function received as argument
  final ValueChanged<int> onPageChanged;

  @override
  State<HorizontalScroll> createState() => _HorizontalScroll();
}

class _HorizontalScroll extends State<HorizontalScroll> {
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 1);

    return Scaffold(
      backgroundColor: Color(0xFF2D2D2D),
      body: PageView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        //if a page change is detected, it executes the function received.
        //this function does not return anything, but changes the
        // allowedVerticalScroll variable y the parent
        onPageChanged: widget.onPageChanged,
        children: const [GalleryPage(), HomeScreen(), AboutMePage()],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
