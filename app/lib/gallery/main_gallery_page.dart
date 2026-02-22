import 'package:alex_snaps/app_content/assets.dart';
import 'package:alex_snaps/app_content/strings.dart';
import 'package:alex_snaps/gallery/filter_search_button.dart';
import 'package:alex_snaps/gallery/row_gallery_buttons.dart';
import 'package:alex_snaps/general/title_text.dart';
import 'package:alex_snaps/widgets/buttons/full_colored_photo_button.dart';
import 'package:flutter/material.dart';

class MainGalleryPageListView extends StatelessWidget {
  const MainGalleryPageListView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final double spacing = 15;

    final items = [
      Column(
        children: [
          TitleText(text: Strings.galleryPageTitle),
          FilterSearchButton(text: Strings.filterSearch),
        ],
      ),
      FullColoredPhotoButton(text: Strings.mainGalleryButton),
      RowGalleryButtons(
        leftText: Strings.galleryColumnOneLeftButton,
        rightText: Strings.galleryColumnOneRightButton,
        leftImage: Assets.images.galleryColumnOneLeftButton,
        rightImage: Assets.images.galleryColumnOneRightButton,
        spacing: spacing,
      ),
      RowGalleryButtons(
        leftText: Strings.galleryColumnTwoLeftButton,
        rightText: Strings.galleryColumnTwoRightButton,
        leftImage: Assets.images.galleryColumnTwoLeftButton,
        rightImage: Assets.images.galleryColumnTwoRightButton,
        spacing: spacing,
      ),

      RowGalleryButtons(
        leftText: Strings.galleryColumnOneLeftButton,
        rightText: Strings.galleryColumnOneRightButton,
        leftImage: Assets.images.galleryColumnOneLeftButton,
        rightImage: Assets.images.galleryColumnOneRightButton,
        spacing: spacing,
      ),
      RowGalleryButtons(
        leftText: Strings.galleryColumnTwoLeftButton,
        rightText: Strings.galleryColumnTwoRightButton,
        leftImage: Assets.images.galleryColumnTwoLeftButton,
        rightImage: Assets.images.galleryColumnTwoRightButton,
        spacing: spacing,
      ),
    ];

    return Scaffold(
      backgroundColor: Color(0xFF2D2D2D),
      body: SafeArea(
        child: ListView.separated(
          //Gives list view the number of elements to build
          itemCount: items.length,
          //Anonymous function that receives (context, index) and
          // returns items[index]. For every item to build, function is called
          //and goes items[1], items[2], items[3]...
          itemBuilder: (context, index) => items[index],
          //Anonymous function that is called everytime a build is finished to
          //separate the elements in the list. The separator is a
          // SizedBox of height spacing (variable)
          separatorBuilder: (_, _) => SizedBox(height: spacing),
          padding: EdgeInsets.only(
            bottom: height * 0.02,
            left: width * 0.08,
            right: width * 0.08,
          ),
        ),
      ),
    );
  }
}
