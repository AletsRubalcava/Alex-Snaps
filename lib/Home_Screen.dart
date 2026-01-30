import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Assets.dart';
import 'Strings.dart';
import 'package:alex_snaps/Home_Photo_Button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
    );

    return Scaffold(
      backgroundColor: Color(0xFF2D2D2D),
      body: Padding(
        padding: EdgeInsets.only(top: 45, left: 30, right: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  Assets.icons.Alex_Snaps_Logo,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).primaryColor,
                    BlendMode.srcIn,
                  ),
                  height: 35,
                  width: 35,
                ),
                Text(
                  Strings.App_Name,
                  style: GoogleFonts.leagueGothic(
                    fontSize: 30,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsGeometry.only(top: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'HOME',
                  style: GoogleFonts.leagueGothic(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
              ),
            ),
            AspectRatio(
              aspectRatio: 1,
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
                      aspectRatio: 4/5,
                      child: HomePhotoButton(
                        photo: 'assets/images/IMG_1661.jpg',
                        text: 'VASCONCELOS',
                      ),
                    ),
                  ),
                  Flexible(
                    child: AspectRatio(
                      aspectRatio: 4/5,
                      child: HomePhotoButton(
                        photo: 'assets/images/IMG_1781.jpg',
                        text: 'WILDLIFE',
                      ),
                    ),
                  ),
                  Flexible(
                    child: AspectRatio(
                      aspectRatio: 4/5,
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
                height: 50,
                width: double.infinity,
                color: Color(0xFF5D5D5D),
                child: Center(
                  child: Text(
                    'LEARN ABOUT ME',
                    style: GoogleFonts.leagueGothic(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
      bottomNavigationBar: FractionallySizedBox(
        heightFactor: 0.1,
        child: ClipRRect(
          borderRadius: BorderRadiusGeometry.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          child: Container(color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}
