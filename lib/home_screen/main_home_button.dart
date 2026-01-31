import 'package:alex_snaps/home_photo_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:alex_snaps/assets.dart';
import 'package:alex_snaps/strings.dart';

class MainHomeButton extends StatelessWidget {
  const MainHomeButton({required this.mainButtonAspectRatio, super.key});

  final double mainButtonAspectRatio;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: mainButtonAspectRatio,
      child: HomePhotoButton(
        photo: Assets.images.mainHomeButton,
        text: Strings.mainHomeButton,
      ),
    );
  }
}
