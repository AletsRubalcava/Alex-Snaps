import 'package:alex_snaps/home_photo_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:alex_snaps/assets.dart';
import 'package:alex_snaps/strings.dart';

class HomeRowButtons extends StatelessWidget {
  const HomeRowButtons({required this.secondaryButtonAspectRatio, super.key});

  final double secondaryButtonAspectRatio;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        Flexible(
          child: AspectRatio(
            aspectRatio: secondaryButtonAspectRatio,
            child: HomePhotoButton(
              photo: Assets.images.leftRowHomeButton,
              text: Strings.leftHomeRowButton,
            ),
          ),
        ),
        Flexible(
          child: AspectRatio(
            aspectRatio: secondaryButtonAspectRatio,
            child: HomePhotoButton(
              photo: Assets.images.middleRowHomeButton,
              text: Strings.middleHomeRowButton,
            ),
          ),
        ),
        Flexible(
          child: AspectRatio(
            aspectRatio: secondaryButtonAspectRatio,
            child: HomePhotoButton(
              photo: Assets.images.rightRowHomeButton,
              text: Strings.rightHomeRowButton,
            ),
          ),
        ),
      ],
    );
  }
}
