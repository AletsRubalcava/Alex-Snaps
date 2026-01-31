import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:alex_snaps/app_content/assets.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({required this.currentPage, super.key});

  final int currentPage;

  @override
  State<BottomNavBar> createState() => _BottomNavBar();
}

class _BottomNavBar extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final iconSize = width * 0.12;

    String galleryIcon = Assets.icons.layoutGrid;
    String homeIcon = Assets.icons.home;
    String userIcon = Assets.icons.user;

    if (widget.currentPage == 0) {
      galleryIcon = Assets.icons.layoutGridBold;
    } else if (widget.currentPage == 1) {
      homeIcon = Assets.icons.homeBold;
    } else if (widget.currentPage == 2) {
      userIcon = Assets.icons.userBold;
    }

    return SizedBox(
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
                  galleryIcon,
                  width: iconSize,
                  colorFilter: ColorFilter.mode(
                    Color(0xFF316163),
                    BlendMode.srcIn,
                  ),
                ),
                SvgPicture.asset(
                  homeIcon,
                  width: iconSize,
                  colorFilter: ColorFilter.mode(
                    Color(0xFF316163),
                    BlendMode.srcIn,
                  ),
                ),
                SvgPicture.asset(
                  userIcon,
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
    );
  }
}
