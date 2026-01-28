import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'Strings.dart';
import 'Assets.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({required this.photo, super.key});

  final String photo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
            children: [
            Positioned.fill(child: Image.asset(photo, fit: BoxFit.cover)),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                height: MediaQuery.of(context).size.height*0.5,
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
            ),
            Positioned(
              left: 25,
              right: 25,
              bottom: 130,
              child: Text(
                Strings.Landing_page_quote,
                style: GoogleFonts.leagueGothic(
                  fontSize: 48,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              bottom: 50,
              left: 0,
              right: 0,
              child: SvgPicture.asset(
                Assets.icons.Arrow_with_circle,
                width: 40,
                height: 40,
                colorFilter: ColorFilter.mode(Color(0xFF60C2C6), BlendMode.srcIn),
              ),
            )
          ]
        )
    );
  }
}