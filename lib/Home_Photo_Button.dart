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
              Align(
                alignment: Alignment.bottomCenter,
                child: FractionallySizedBox(
                    heightFactor: 0.4,
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
                )
              ),
              Positioned(
                bottom: 6,
                left: width*0.1,
                right: 30,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Text(
                      text,
                      style: GoogleFonts.leagueGothic(
                        fontSize: constraints.maxWidth * 0.2,
                        color: Colors.white,
                      ),
                    );
                  },
                ),
              )
            ]
        )
        )
    );
  }
}