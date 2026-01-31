import 'package:alex_snaps/app_content/assets.dart';
import 'package:alex_snaps/app_content/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatelessWidget{
  const Header({required this.width, super.key});

  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}