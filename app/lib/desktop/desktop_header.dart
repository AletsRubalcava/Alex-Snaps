import 'package:alex_snaps/app_content/strings.dart';
import 'package:alex_snaps/general/title_text.dart';
import 'package:flutter/material.dart';
import 'package:alex_snaps/app_content/assets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DesktopHeader extends StatelessWidget implements PreferredSizeWidget {
  const DesktopHeader({super.key}) : preferredSize = const Size.fromHeight(80);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF2D2D2D),
        boxShadow: [
          BoxShadow(
            color: Colors.black54.withAlpha(128),
            spreadRadius: 5,
            blurRadius: 7,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.02,
          vertical: height * 0.02,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              Assets.icons.alexSnapsLogo,
              colorFilter: ColorFilter.mode(
                Theme.of(context).primaryColor,
                BlendMode.srcIn,
              ),
              height: height * 0.05,
            ),
            TitleText(
              text: Strings.homePageTitle,
              fontSize: width * 0.025,
              textHeight: 1,
            ),
            TitleText(
              text: Strings.galleryPageTitle,
              fontSize: width * 0.025,
              textHeight: 1,
            ),
            TitleText(
              text: Strings.aboutMePageTitle,
              fontSize: width * 0.025,
              textHeight: 1,
            ),
            Text(
              Strings.appName,
              style: GoogleFonts.leagueGothic(
                fontSize: width * 0.025,
                color: Theme.of(context).primaryColor,
                height: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
