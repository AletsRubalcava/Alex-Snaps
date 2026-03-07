import 'package:flutter/material.dart';
import 'package:alex_snaps/app_content/assets.dart';
import 'desktop_photo_card.dart';

class DesktopRightSideGrid extends StatelessWidget {
  const DesktopRightSideGrid({required this.width, super.key});

  final double width;

  @override
  Widget build(BuildContext context) {
    if (width < 1110) {
      return Column(
        spacing: 10,
        children: [
          Expanded(
            child: DesktopPhotoCard(
              photo: Assets.images.mainHomeButton,
              text: 'VERACRUZ',
              aspectRatio: 16 / 9,
            ),
          ),
          Expanded(
            child: DesktopPhotoCard(
              photo: Assets.images.mainHomeButton,
              text: 'ABOUT ME',
              aspectRatio: 16 / 9,
            ),
          ),
        ],
      );
    }

    return Column(
      spacing: 10,
      children: [
        Expanded(
          child: Row(
            spacing: 10,
            children: [
              Expanded(
                child: DesktopPhotoCard(
                  photo: Assets.images.mainHomeButton,
                  text: 'VASCONCELOS',
                ),
              ),
              Expanded(
                child: DesktopPhotoCard(
                  photo: Assets.images.mainHomeButton,
                  text: 'WILDLIFE',
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            spacing: 10,
            children: [
              Expanded(
                child: DesktopPhotoCard(
                  photo: Assets.images.mainHomeButton,
                  text: 'VERACRUZ',
                ),
              ),
              Expanded(
                child: DesktopPhotoCard(
                  photo: Assets.images.mainHomeButton,
                  text: 'ABOUT ME',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
