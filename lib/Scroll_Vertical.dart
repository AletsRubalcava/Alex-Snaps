import 'package:alex_snaps/Landing_Page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Assets.dart';

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
  List<Widget> pages = [
    LandingPage(photo: Assets.images.Landing_page_image),
    SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Card(
        color: Colors.green,
        child: Center(
          child: Text('Screen 2'),
        ),
      ),
    )
  ];
}