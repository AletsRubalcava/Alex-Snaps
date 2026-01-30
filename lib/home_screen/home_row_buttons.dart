import 'package:alex_snaps/home_photo_button.dart';
import 'package:flutter/cupertino.dart';

class HomeRowButtons extends StatelessWidget{
  const HomeRowButtons({required this.secondaryButtonAspectRatio,super.key});

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
              photo: 'assets/images/IMG_1661.jpg',
              text: 'VASCONCELOS',
            ),
          ),
        ),
        Flexible(
          child: AspectRatio(
            aspectRatio: secondaryButtonAspectRatio,
            child: HomePhotoButton(
              photo: 'assets/images/IMG_1781.jpg',
              text: 'WILDLIFE',
            ),
          ),
        ),
        Flexible(
          child: AspectRatio(
            aspectRatio: secondaryButtonAspectRatio,
            child: HomePhotoButton(
              photo: 'assets/images/IMG_0775.jpg',
              text: 'VERACRUZ',
            ),
          ),
        ),
      ],
    );
  }
}