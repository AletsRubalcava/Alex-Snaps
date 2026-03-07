import 'package:alex_snaps/desktop/bottom_bar.dart';
import 'package:alex_snaps/desktop/desktop_header.dart';
import 'package:alex_snaps/general/title_text.dart';
import 'package:alex_snaps/widgets/buttons/gradient_photo_button.dart';
import 'package:flutter/material.dart';
import 'package:alex_snaps/app_content/strings.dart';
import 'package:alex_snaps/app_content/assets.dart';

class DesktopHomeScreen extends StatelessWidget {
  const DesktopHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    double categoryAspectRatio = 16 / 9;

    if (width < 1300) {
      categoryAspectRatio = 4 / 5;
    }

    debugPrint('width: $width');
    debugPrint('height: $height');

    return Scaffold(
      backgroundColor: Color(0xFF2D2D2D),
      appBar: DesktopHeader(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.04,
            vertical: height * 0.04,
          ),
          child: Column(
            children: [
              TitleText(text: Strings.homePageTitle, fontSize: width * 0.04),
              Expanded(
                child: Row(
                  children: [
                    AspectRatio(
                      aspectRatio: 5 / 4,
                      child: GradientPhotoButton(
                        photo: Assets.images.mainHomeButton,
                        text: Strings.mainHomeButton,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          spacing: 10,
                          children: [
                              Expanded(
                                child: Row(
                                  spacing: 10,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      child: AspectRatio(
                                        aspectRatio: categoryAspectRatio,
                                        child: GradientPhotoButton(
                                          photo: Assets.images.mainHomeButton,
                                          text: 'VASCONCELOS',
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: AspectRatio(
                                        aspectRatio: categoryAspectRatio,
                                        child: GradientPhotoButton(
                                          photo: Assets.images.mainHomeButton,
                                          text: 'WILDLIFE',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  spacing: 10,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      child: AspectRatio(
                                        aspectRatio: categoryAspectRatio,
                                        child: GradientPhotoButton(
                                          photo: Assets.images.mainHomeButton,
                                          text: 'VERACRUZ',
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: AspectRatio(
                                        aspectRatio: categoryAspectRatio,
                                        child: GradientPhotoButton(
                                          photo: Assets.images.mainHomeButton,
                                          text: 'ABOUT ME',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(height: 80),
    );
  }
}
