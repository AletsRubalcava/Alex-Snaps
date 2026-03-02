import 'package:alex_snaps/home_screen/about_me_button.dart';
import 'package:alex_snaps/home_screen/home_row_buttons.dart';
import 'package:alex_snaps/general/title_text.dart';
import 'package:alex_snaps/home_screen/main_home_button.dart';
import 'package:alex_snaps/photo_repository.dart';
import 'package:flutter/material.dart';
import 'package:alex_snaps/app_content/strings.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({required this.onNavigate, super.key});

  final Function(int) onNavigate;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFF2D2D2D),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            final height = constraints.maxHeight;
            final dbSize =
                context
                    .read<PhotoRepository>()
                    .categories
                    .length;

            double mainButtonAspectRatio = 1;
            double secondaryButtonAspectRatio = 5 / 8;

            if (dbSize == 0) {
              mainButtonAspectRatio = 11 / 17;
            }

            if (height < 800) {
              mainButtonAspectRatio = 5 / 4;
              secondaryButtonAspectRatio = 4 / 5;
            }

            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: height,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.08,
                    vertical: height * 0.02,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    spacing: (height < 700) ? 10 : 0,
                    children: [
                      TitleText(text: Strings.homePageTitle),

                      MainHomeButton(
                        mainButtonAspectRatio: mainButtonAspectRatio,
                      ),

                      HomeRowButtons(
                        secondaryButtonAspectRatio:
                        secondaryButtonAspectRatio,
                      ),

                      if (dbSize != 0)
                        AboutMeButton(
                          width: width,
                          height: height,
                          onNavigate: onNavigate,
                        ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
