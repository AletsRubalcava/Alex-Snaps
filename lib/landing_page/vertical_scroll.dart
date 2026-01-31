import 'package:alex_snaps/horizontal_scroll.dart';
import 'landing_page.dart';
import 'package:flutter/material.dart';

class ScrollVertical extends StatefulWidget {
  const ScrollVertical({super.key});

  @override
  State<ScrollVertical> createState() => _ScrollVertical();
}

class _ScrollVertical extends State<ScrollVertical> {
  final PageController _controller = PageController();
  bool allowedVerticalScroll = true;
  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      scrollDirection: Axis.vertical,
      physics:
          allowedVerticalScroll //if...
          ? const PageScrollPhysics() //if true, you can scroll
          : const NeverScrollableScrollPhysics(), //if false, you cannot scroll
      children: [
        const LandingPage(),
        //HorizontalScroll receives a function as an argument
        HorizontalScroll(
          //A function that has index as argument
          onPageChanged: (index) {
            //Builds again the widget
            setState(() {
              //if (index == 1) -> true : false
              //currentPage = index of the page active
              allowedVerticalScroll = index == 1;
              currentPage = index;
            });
          },
          currentPage: currentPage,
        ),
      ],
    );
  }
}
