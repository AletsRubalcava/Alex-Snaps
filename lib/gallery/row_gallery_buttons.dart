import 'package:flutter/cupertino.dart';
import 'package:alex_snaps/widgets/buttons/gradient_photo_button.dart';

class RowGalleryButtons extends StatelessWidget {
  const RowGalleryButtons({
    required this.leftText,
    required this.rightText,
    required this.leftImage,
    required this.rightImage,
    required this.width,
    required this.height,
    required this.spacing,
  });

  final String leftText;
  final String rightText;
  final String leftImage;
  final String rightImage;
  final double width;
  final double height;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: spacing,
      children: [
        Flexible(
          child: AspectRatio(
            aspectRatio: 1,
            child: GradientPhotoButton(photo: leftImage, text: leftText),
          ),
        ),
        Flexible(
          child: AspectRatio(
            aspectRatio: 1,
            child: GradientPhotoButton(photo: rightImage, text: rightText),
          ),
        ),
      ],
    );
  }
}
