import 'package:alex_snaps/gallery/closed_filter_search_button.dart';
import 'package:alex_snaps/gallery/opened_filter_search_button.dart';
import 'package:flutter/material.dart';

class FilterSearchButton extends StatefulWidget {
  const FilterSearchButton({
    required this.text,
    required this.aspectRatio,
    super.key,
  });

  final String text;
  final double aspectRatio;

  @override
  State<FilterSearchButton> createState() => _FilterSearchButton();
}

class _FilterSearchButton extends State<FilterSearchButton> {
  bool showSelector = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          showSelector = !showSelector;
        });
      },
      child: showSelector
          ? OpenedFilterSearchButton(aspectRatio: 16 / 9)
          : ClosedFilterSearchButton(
              text: widget.text,
              aspectRatio: widget.aspectRatio,
            ),
    );
  }
}
