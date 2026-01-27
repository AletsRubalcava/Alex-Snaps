import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:alex_snaps/Strings.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({required this.photo, super.key});

  final String photo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Positioned.fill(child: Image.asset(photo, fit: BoxFit.cover)),
            Align(
                alignment: Alignment.bottomCenter,
                child: FractionallySizedBox(
                    heightFactor: 0.5,
                    widthFactor: 1,
                    alignment: Alignment.bottomCenter,
                    child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.transparent, Color(0x802D2D2D),Color(0xFF2D2D2D)],
                              stops: [0.0, 0.45, 1]
                          ),
                        )
                    )
                )
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 25, bottom: 130),
                  child: Text(
                    Strings.Landing_page_quote,
                    style: GoogleFonts.leagueGothic(
                      fontSize: 48,
                      color: Colors.white,
                    ),
                  ),
              )
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 50),
                child: SvgPicture.asset(
                    'assets/icons/arrow-down-circle-svgrepo-com.svg',
                  width: 40,
                  height: 40,
                  colorFilter: ColorFilter.mode(Color(0xFF60C2C6), BlendMode.srcIn),
                ),
              ),
            )
          ]
        )
    );
  }
}