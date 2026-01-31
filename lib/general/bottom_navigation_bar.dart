import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:alex_snaps/app_content/assets.dart';

class BottomNavBar extends StatelessWidget{
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final iconSize = width * 0.12;

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
                  Assets.icons.layoutGrid,
                  width: iconSize,
                  colorFilter: ColorFilter.mode(
                    Color(0xFF316163),
                    BlendMode.srcIn,
                  ),
                ),
                SvgPicture.asset(
                  Assets.icons.homeBold,
                  width: iconSize,
                  colorFilter: ColorFilter.mode(
                    Color(0xFF316163),
                    BlendMode.srcIn,
                  ),
                ),
                SvgPicture.asset(
                  Assets.icons.user,
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