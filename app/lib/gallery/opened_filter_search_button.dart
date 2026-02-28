import 'package:alex_snaps/category_selector.dart';
import 'package:alex_snaps/gallery/photo_gallery_page.dart';
import 'package:alex_snaps/photo_repository.dart';
import 'package:alex_snaps/widgets/buttons/generic_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared/category_class.dart';

class OpenedFilterSearchButton extends StatefulWidget {
  const OpenedFilterSearchButton({required this.aspectRatio, super.key});

  final double aspectRatio;

  @override
  State<OpenedFilterSearchButton> createState() => _OpenedFilterSearchButton();
}

class _OpenedFilterSearchButton extends State<OpenedFilterSearchButton> {
  final List<Category> selected = [];
  late final PhotoRepository db;
  late final List<Category> categories;
  final unselectedColor = Color(0xFF505050);
  final selectedColor = Color(0xFF343434);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    db = context.read<PhotoRepository>();
    categories = db.categories.values.toList();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(10),
      child: Container(
        color: Color(0xFF343434),
        child: Padding(
          padding: EdgeInsets.all(width * 0.03),
          child: Column(
            spacing: 8,
            children: [
              if (selected.isNotEmpty)
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusGeometry.circular(10),
                    color: Color(0xFF505050),
                  ),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: selected.isNotEmpty
                          ? EdgeInsets.all(8)
                          : EdgeInsets.zero,
                      child: Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          for (final cat in selected)
                            CategorySelector(
                              category: cat,
                              selected: (value) {
                                setState(() {
                                  selected.remove(value);
                                  categories.add(value);
                                });
                              },
                              color: selectedColor,
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              if (categories.isNotEmpty)
                Align(
                  alignment: Alignment.topLeft,
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      for (final cat in categories)
                        CategorySelector(
                          category: cat,
                          selected: (value) {
                            setState(() {
                              selected.add(value);
                              categories.remove(value);
                            });
                          },
                          color: unselectedColor,
                        ),
                    ],
                  ),
                ),
              if (selected.isNotEmpty)
                GenericButton(
                  'FILTER',
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, _, _) => GalleryPhotoPage(categoryList: selected.map((e) => e.name).toList(), text: 'CUSTOM'),
                        transitionDuration: const Duration(milliseconds: 0),
                        reverseTransitionDuration: const Duration(milliseconds: 0),
                      ),
                    );
                  },
                  width: double.infinity,
                  fontSize: width * 0.07,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
