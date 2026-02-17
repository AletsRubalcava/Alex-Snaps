import 'package:alex_snaps/general/title_text.dart';
import 'package:flutter/material.dart';
import 'package:alex_snaps/app_content/assets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:alex_snaps/app_content/strings.dart';

class AboutMePage extends StatelessWidget {
  const AboutMePage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          top: height * 0.01,
          left: width * 0.08,
          right: width * 0.08,
        ),
        child: Scaffold(
          backgroundColor: Color(0xFF2D2D2D),
          body: Column(
            spacing: height * 0.04,
            children: [
              Column(
                children: [
                  TitleText(
                    text: Strings.aboutMePageTitle,
                    textHeight: 1,
                    paddingTop: height * 0.02,
                  ),
                  TitleText(
                    text: Strings.myName,
                    fontSize: width * 0.07,
                    paddingTop: 0,
                    textHeight: 1,
                  ),
                ],
              ),
              CircleAvatar(
                backgroundImage: AssetImage(Assets.images.aboutMePicture),
                radius: width * 0.33,
              ),
              Text(
                Strings.presentation,
                style: GoogleFonts.leagueGothic(
                  color: Colors.white,
                  fontSize: width * 0.05,
                ),
                textAlign: TextAlign.justify,
              ),
              FittedBox(
                child: Row(
                  spacing: 8,
                  children: [
                    SvgPicture.asset(
                      Assets.icons.instagramIcon,
                      colorFilter: ColorFilter.mode(
                        Theme.of(context).primaryColor,
                        BlendMode.srcIn,
                      ),
                      width: width * 0.11,
                    ),
                    TitleText(
                      text: Strings.instagramUser,
                      fontSize: width * 0.1,
                      paddingBottom: 5,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
