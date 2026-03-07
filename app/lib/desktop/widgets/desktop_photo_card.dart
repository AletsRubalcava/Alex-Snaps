import 'package:flutter/material.dart';
import 'package:alex_snaps/widgets/buttons/gradient_photo_button.dart';

class DesktopPhotoCard extends StatelessWidget {
  const DesktopPhotoCard({
    required this.photo,
    required this.text,
    this.aspectRatio = 4 / 5,
    super.key,
  });

  final String photo;
  final String text;
  final double aspectRatio;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: aspectRatio,
        child: GradientPhotoButton(
          photo: photo,
          text: text,
        ),
    );
  }
}
