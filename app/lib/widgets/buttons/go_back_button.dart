import 'package:flutter/cupertino.dart';
import 'package:alex_snaps/app_content/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GoBackButton extends StatelessWidget {
  const GoBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: SvgPicture.asset(
              Assets.icons.arrowLeftCircle,
              colorFilter: ColorFilter.mode(
                Theme
                    .of(context)
                    .primaryColor,
                BlendMode.srcIn,
              ),
              width: width * 0.15,
            ),
    );
  }
}