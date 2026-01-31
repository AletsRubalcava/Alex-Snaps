import 'package:flutter/material.dart';
import 'package:alex_snaps/home_screen/home_layout.dart';
import 'package:alex_snaps/about_me/about_me_page.dart';
import 'package:alex_snaps/gallery/gallery_page.dart';

class HorizontalScroll extends StatelessWidget {
  HorizontalScroll({super.key});
  final PageController _controller = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      scrollDirection: Axis.horizontal,
      children: [
        GalleryPage(),
        HomeLayout(),
        AboutMePage()
      ],
    );
  }
}