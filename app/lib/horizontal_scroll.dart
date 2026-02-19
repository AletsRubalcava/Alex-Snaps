import 'bottom_nav_bar/bottom_navigation_bar.dart';
import 'package:alex_snaps/general/header.dart';
import 'package:alex_snaps/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:alex_snaps/about_me/about_me_page.dart';
import 'gallery/main_gallery_page_list_view.dart';

class HorizontalScroll extends StatefulWidget {
  const HorizontalScroll({
    required this.onPageChanged,
    required this.currentPage,
    super.key,
  });

  //Saves the void function received as argument
  final ValueChanged<int> onPageChanged;
  final int currentPage;

  @override
  State<HorizontalScroll> createState() => _HorizontalScroll();
}

class _HorizontalScroll extends State<HorizontalScroll> {

  PageController controller = PageController(initialPage: 1);

  @override void initState() {
    super.initState();
  }

  @override void dispose() {
    controller.dispose();
    super.dispose();
  }

  void goToPage(int page) {
    if (controller.hasClients && !controller.position.isScrollingNotifier.value) {
      controller.jumpToPage(page);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2D2D2D),
      appBar: Header(),
      body: PageView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        //if a page change is detected, it executes the function received.
        //this function does not return anything, but changes the
        // allowedVerticalScroll variable y the parent
        onPageChanged: widget.onPageChanged,
        children: [MainGalleryPageListView(), HomeScreen(onNavigate: goToPage), AboutMePage()],
      ),
      bottomNavigationBar: BottomNavBar(currentPage: widget.currentPage),
    );
  }
}
