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

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final dbSize = context.read<PhotoRepository>().categories.length;

    double mainButtonAspectRatio = 1;
    double secondaryButtonAspectRatio = 5 / 8;

    if(dbSize == 0){
     mainButtonAspectRatio = 11 / 17;
    }
    if (height < 700) {
      mainButtonAspectRatio = 5 / 4;
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
              TitleText(text: Strings.homePageTitle),
              MainHomeButton(mainButtonAspectRatio: mainButtonAspectRatio),
              Spacer(),
              HomeRowButtons(
                secondaryButtonAspectRatio: secondaryButtonAspectRatio,
              ),
              if(dbSize != 0) Spacer(),
              AboutMeButton(width: width, height: height, onNavigate: onNavigate),
              Spacer(),
            ],
          ),
        )
      ),
    );
  }
}
