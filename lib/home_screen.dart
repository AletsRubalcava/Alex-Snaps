import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'assets.dart';
import 'strings.dart';
import 'package:alex_snaps/home_photo_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>{

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    Assets.icons.alexSnapsLogo,
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).primaryColor,
                      BlendMode.srcIn,
                    ),
                    width: width * 0.15,
                  ),
                  Text(
                    Strings.appName,
                    style: GoogleFonts.leagueGothic(
                      fontSize: width * 0.07,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsGeometry.only(top: height * 0.005),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'HOME',
                    style: GoogleFonts.leagueGothic(
                      color: Colors.white,
                      fontSize: width * 0.10,
                    ),
                  ),
                ),
              ),
              AspectRatio(
                aspectRatio: mainButtonAspectRatio,
                child: HomePhotoButton(
                  photo: 'assets/images/IMG_0701.jpg',
                  text: 'VIEW ALL',
                ),
              ),
              Spacer(),
              Row(
                spacing: 10,
                children: [
                  Flexible(
                    child: AspectRatio(
                      aspectRatio: secondaryButtonAspectRatio,
                      child: HomePhotoButton(
                        photo: 'assets/images/IMG_1661.jpg',
                        text: 'VASCONCELOS',
                      ),
                    ),
                  ),
                  Flexible(
                    child: AspectRatio(
                      aspectRatio: secondaryButtonAspectRatio,
                      child: HomePhotoButton(
                        photo: 'assets/images/IMG_1781.jpg',
                        text: 'WILDLIFE',
                      ),
                    ),
                  ),
                  Flexible(
                    child: AspectRatio(
                      aspectRatio: secondaryButtonAspectRatio,
                      child: HomePhotoButton(
                        photo: 'assets/images/IMG_0775.jpg',
                        text: 'VERACRUZ',
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(20),
                child: Container(
                  height: height * 0.07,
                  width: double.infinity,
                  color: Color(0xFF5D5D5D),
                  child: Center(
                    child: Text(
                      'LEARN ABOUT ME',
                      style: GoogleFonts.leagueGothic(
                        color: Colors.white,
                        fontSize: width * 0.08,
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: height * 0.10,
        child: ClipRRect(
          borderRadius: BorderRadiusGeometry.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          child: Container(
            color: Theme.of(context).primaryColor,
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    'assets/icons/layout-grid.svg',
                    width: iconSize,
                    colorFilter: ColorFilter.mode(
                      Color(0xFF316163),
                      BlendMode.srcIn,
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/icons/home.svg',
                    width: iconSize,
                    colorFilter: ColorFilter.mode(
                      Color(0xFF316163),
                      BlendMode.srcIn,
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/icons/user.svg',
                    width: iconSize,
                    colorFilter: ColorFilter.mode(
                      Color(0xFF316163),
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}