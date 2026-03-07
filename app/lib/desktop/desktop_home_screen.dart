import 'package:alex_snaps/desktop/bottom_bar.dart';
import 'package:alex_snaps/desktop/desktop_header.dart';
import 'package:alex_snaps/general/title_text.dart';
import 'package:flutter/material.dart';
import 'package:alex_snaps/app_content/strings.dart';
import 'package:alex_snaps/app_content/assets.dart';
import 'widgets/desktop_photo_card.dart';
import 'widgets/desktop_right_side_grid.dart';

class DesktopHomeScreen extends StatelessWidget {
  const DesktopHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF2D2D2D),
      appBar: const DesktopHeader(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.04,
            vertical: height * 0.04,
          ),
          child: Column(
            children: [
              TitleText(text: Strings.homePageTitle, fontSize: width * 0.04),
              const SizedBox(height: 20),
              Expanded(
                child: width < 900
                    ? Expanded(
                        child: DesktopPhotoCard(
                          photo: Assets.images.mainHomeButton,
                          text: Strings.mainHomeButton,
                          aspectRatio: 16 / 9,
                        ),
                      )
                    : Row(
                        children: [
                          Expanded(
                            child: DesktopPhotoCard(
                              photo: Assets.images.mainHomeButton,
                              text: Strings.mainHomeButton,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(child: DesktopRightSideGrid(width: width)),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomBar(height: 80),
    );
  }
}
