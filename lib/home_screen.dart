import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'header.dart';
import 'home_screen/home_title.dart';
import 'home_screen/home_row_buttons.dart';
import 'home_screen/about_me_button.dart';
import 'home_screen/main_home_button.dart';
import 'bottom_navigation_bar.dart';
import 'assets.dart';

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

    final iconSize = width * 0.12;

    double mainButtonAspectRatio;
    double secondaryButtonAspectRatio;

    if (height < 700) {
      mainButtonAspectRatio = 5 / 4;
      secondaryButtonAspectRatio = 4 / 5;
    } else {
      mainButtonAspectRatio = 1;
      secondaryButtonAspectRatio = 5 / 8;
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
        ),
      ),
      bottomNavigationBar: BottomNavBar(height: height, iconSize: iconSize),
    );
  }
}
