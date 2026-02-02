import 'package:alex_snaps/gallery/filter_search_button.dart';
import 'package:alex_snaps/general/header.dart';
import 'package:alex_snaps/general/title_text.dart';
import 'package:flutter/material.dart';
import 'package:alex_snaps/widgets/photo_display.dart';
import 'package:alex_snaps/app_content/strings.dart';

class GalleryPhotoPage extends StatelessWidget {
  const GalleryPhotoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final photos = [
      'assets/images/dummy.jpg',
      'assets/images/dummy.jpg',
      'assets/images/dummy.jpg',
      'assets/images/dummy.jpg',
      'assets/images/dummy.jpg',
      'assets/images/dummy.jpg',
      'assets/images/dummy.jpg',
      'assets/images/dummy.jpg',
      'assets/images/dummy.jpg',
      'assets/images/dummy.jpg',
      'assets/images/dummy.jpg',
      'assets/images/dummy.jpg',
      'assets/images/dummy.jpg',
      'assets/images/dummy.jpg',
      'assets/images/dummy.jpg',
      'assets/images/dummy.jpg',
      'assets/images/dummy.jpg',
      'assets/images/dummy.jpg',
      'assets/images/dummy.jpg',
      'assets/images/dummy.jpg',
      'assets/images/dummy.jpg',
      'assets/images/dummy.jpg',
      'assets/images/dummy.jpg',
      'assets/images/dummy.jpg',
      'assets/images/dummy.jpg',
      'assets/images/dummy.jpg',
      'assets/images/dummy.jpg',
      'assets/images/dummy.jpg',
      'assets/images/dummy.jpg',
      'assets/images/dummy.jpg',
      'assets/images/dummy.jpg',
      'assets/images/dummy.jpg',
      'assets/images/dummy.jpg',
      'assets/images/dummy.jpg',
      'assets/images/dummy.jpg',
      'assets/images/dummy.jpg',
    ];

    return Scaffold(
      backgroundColor: Color(0xFF2D2D2D),
      appBar: Header(),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsetsGeometry.only(
                bottom: height * 0.02,
                left: width * 0.08,
                right: width * 0.08,
              ),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleText(text: Strings.galleryPageTitle),
                    FilterSearchButton(text: Strings.filterSearch),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsetsGeometry.only(
                bottom: height * 0.02,
                left: width * 0.08,
                right: width * 0.08,
              ),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => PhotoDisplay(photo: photos[index]),
                  childCount: photos.length,
                ),

                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  childAspectRatio: 4/5
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
