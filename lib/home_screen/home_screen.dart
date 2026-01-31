import 'package:alex_snaps/general/header.dart';
import 'package:alex_snaps/home_screen/about_me_button.dart';
import 'package:alex_snaps/home_screen/home_row_buttons.dart';
import 'package:alex_snaps/home_screen/home_title.dart';
import 'package:alex_snaps/home_screen/main_home_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    double mainButtonAspectRatio = 1;
    double secondaryButtonAspectRatio = 5 / 8;

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
              Header(width: width),
              HomeTitle(width: width, height: height),
              MainHomeButton(mainButtonAspectRatio: mainButtonAspectRatio),
              Spacer(),
              HomeRowButtons(
                secondaryButtonAspectRatio: secondaryButtonAspectRatio,
              ),
              Spacer(),
              AboutMeButton(width: width, height: height),
              Spacer(),
            ],
          ),
        )
      ),
    );
  }
}
