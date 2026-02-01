import 'package:alex_snaps/general/title_text.dart';
import 'package:flutter/material.dart';
import 'package:alex_snaps/app_content/strings.dart';
import 'filter_search_button.dart';
import 'package:alex_snaps/widgets/buttons/full_colored_photo_button.dart';
import 'row_gallery_buttons.dart';
import 'package:alex_snaps/app_content/assets.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final double spacing = 15;

    return Scaffold(
      backgroundColor: Color(0xFF2D2D2D),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: height * 0.01,
            left: width * 0.08,
            right: width * 0.08,
          ),
          child: Column(
            spacing: spacing,
            children: [
              TitleText(
                text: Strings.galleryPageTitle,
                width: width,
                height: height,
              ),
              FilterSearchButton(width: width, text: Strings.filterSearch),
              FullColoredPhotoButton(
                text: Strings.mainGalleryButton,
                width: width,
                height: height,
              ),
              RowGalleryButtons(
                leftText: Strings.galleryColumnOneLeftButton,
                rightText: Strings.galleryColumnOneRightButton,
                leftImage: Assets.images.galleryColumnOneLeftButton,
                rightImage: Assets.images.galleryColumnOneRightButton,
                width: width,
                height: height,
                spacing: spacing,
              ),
              RowGalleryButtons(
                leftText: Strings.galleryColumnTwoLeftButton,
                rightText: Strings.galleryColumnTwoRightButton,
                leftImage: Assets.images.galleryColumnTwoLeftButton,
                rightImage: Assets.images.galleryColumnTwoRightButton,
                width: width,
                height: height,
                spacing: spacing,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
