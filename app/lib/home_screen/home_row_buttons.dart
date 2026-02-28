import 'package:alex_snaps/photo_repository.dart';
import 'package:alex_snaps/widgets/buttons/gradient_photo_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'dart:math';

class HomeRowButtons extends StatelessWidget {
  const HomeRowButtons({required this.secondaryButtonAspectRatio, super.key});

  final double secondaryButtonAspectRatio;

  @override
  Widget build(BuildContext context) {
    final db = context.read<PhotoRepository>();
    final random = Random();

    final categories = db.categories.values.toList();
    categories.shuffle(random);

    final double aspectRatio;

    if (categories.length == 2) {
      aspectRatio = 1;
    } else if (categories.length == 1) {
      aspectRatio = 16 / 9;
    } else {
      aspectRatio = secondaryButtonAspectRatio;
    }

    return Row(
      spacing: 10,
      children: [
        for (int i = 0; i < 3 && i < categories.length; i++)
          Flexible(
            child: AspectRatio(
              aspectRatio: aspectRatio,
              child: GradientPhotoButton(
                photo: db.thumbs[categories[i].thumbId]!.route,
                text: db.categories[categories[i].id]!.name.toUpperCase(),
                category: categories[i].name,
              ),
            ),
          ),
      ],
    );
  }
}
