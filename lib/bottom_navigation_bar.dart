import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavBar extends StatelessWidget{
  const BottomNavBar({required this.height, required this.iconSize, super.key});

  final double height;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
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
                  'assets/icons/layout-grid.svg',
                  width: iconSize,
                  colorFilter: ColorFilter.mode(
                    Color(0xFF316163),
                    BlendMode.srcIn,
                  ),
                ),
                SvgPicture.asset(
                  'assets/icons/home.svg',
                  width: iconSize,
                  colorFilter: ColorFilter.mode(
                    Color(0xFF316163),
                    BlendMode.srcIn,
                  ),
                ),
                SvgPicture.asset(
                  'assets/icons/user.svg',
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