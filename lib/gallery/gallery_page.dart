import 'package:alex_snaps/home_screen/about_me_button.dart';
import 'package:alex_snaps/home_screen/home_row_buttons.dart';
import 'package:alex_snaps/general/title_text.dart';
import 'package:flutter/material.dart';
import 'package:alex_snaps/app_content/strings.dart';
import 'filter_search_button.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    double secondaryButtonAspectRatio = 5 / 8;

    if (height < 700) {
      secondaryButtonAspectRatio = 4 / 5;
    }

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
            children: [
              TitleText(text: Strings.galleryPageTitle, width: width, height: height),
              FilterSearchButton(width: width, text: 'FILTER SEARCH'),
              Spacer(),
              HomeRowButtons(
                secondaryButtonAspectRatio: secondaryButtonAspectRatio,
              ),
              Spacer(),
              AboutMeButton(width: width, height: height),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
