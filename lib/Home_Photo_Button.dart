import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Assets.dart';

class HomePhotoButton extends StatelessWidget{
  const HomePhotoButton({
    required this.photo,
    required this.width,
    required this.height,
    required this.text,
    super.key
  });

  final String photo;
  final String text;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(20),
        child: Container(
          width: width,
          height: height,
          child: Stack(
            children: [
              Positioned.fill(
                  child: Image.asset(photo, fit: BoxFit.cover)
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  height: MediaQuery.of(context).size.height*0.1,
                  child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.transparent, Color(0x8060C2C6),Color(0xFF60C2C6)],
                            stops: [0.0, 0.75, 1]
                        ),
                      )
                  )
              ),
              Positioned(
                bottom: 6,
                  left: 30,
                  child: Text(
                    text,
                    style: GoogleFonts.leagueGothic(
                      fontSize: 40,
                      color: Colors.white
                    ),
                  )
              ),
              Positioned(
                  bottom: 21,
                  left: 145,
                  child: SvgPicture.asset(
                    Assets.icons.arrow_right_circle,
                    width: 25,
                    colorFilter: ColorFilter.mode(Color(0xFF60C2C6), BlendMode.srcIn),
                  )
              )
            ]
        )
        )
    );
  }
}