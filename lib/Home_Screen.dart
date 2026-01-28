import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Assets.dart';
import 'Strings.dart';
import 'package:alex_snaps/Home_Photo_Button.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light
      )
    );

    return Scaffold(
      backgroundColor: Color(0xFF2D2D2D),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 45, left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                spacing: 20,
                children: [
                  SvgPicture.asset(
                    Assets.icons.Alex_Snaps_Logo,
                    colorFilter: ColorFilter.mode(Color(0xFF60C2C6), BlendMode.srcIn),
                    height: 35,
                    width: 35,
                  ),
                  Text(
                    Strings.App_Name,
                    style: GoogleFonts.leagueGothic(
                      fontSize: 30,
                      color: Color(0xFF60C2C6)
                    ),
                  )
                ]
              )
          ),
          Center(
              child: HomePhotoButton(
                  photo: 'assets/images/IMG_0701.jpg',
                  width: 300,
                  height: 300,
                  text: 'VIEW ALL'
              )
          )
        ],
      )
    );
  }
}