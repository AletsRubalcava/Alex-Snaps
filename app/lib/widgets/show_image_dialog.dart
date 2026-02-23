import 'dart:ui';
import 'package:flutter/material.dart';

void showImageDialog(BuildContext context, String image) {
  showDialog(
    context: context,
    barrierColor: Colors.black.withAlpha(77), // 0.3 of 255 (max)
    barrierDismissible: false,
    builder: (context) {
      return Stack(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(color: Colors.black.withAlpha(0)),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Center(
              child: Container(
                padding: EdgeInsets.all(16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(image),
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}
