import 'package:alex_snaps/gallery/filter_search_button.dart';
import 'package:alex_snaps/general/header.dart';
import 'package:alex_snaps/general/title_text.dart';
import 'package:alex_snaps/widgets/buttons/go_back_button.dart';
import 'package:flutter/material.dart';
import 'package:alex_snaps/widgets/photo_display.dart';
import 'package:alex_snaps/app_content/strings.dart';
import 'package:alex_snaps/photo_repository.dart';
import 'package:provider/provider.dart';
import 'package:shared/photo_class.dart';

class GalleryPhotoPage extends StatefulWidget {
  const GalleryPhotoPage({required this.categoryList, this.text, super.key});

  final String? text;
  final List<String?> categoryList;

  @override
  State<GalleryPhotoPage> createState() => _GalleryPhotoPageState();
}

class _GalleryPhotoPageState extends State<GalleryPhotoPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final titleText = widget.text ?? Strings.galleryPageTitle;
    final db = context.read<PhotoRepository>();
    final List<Photo> photo;

    if (widget.categoryList.isNotEmpty) {
      photo = db.photos.values
          .where((photo) => photo.categories.any((category) => widget.categoryList.contains(category)))
          .toList();
    } else {
      photo = db.photos.values.toList();
      photo.sort((a, b) => a.order.compareTo(b.order));
    }

    final photos = photo.map((photo) => photo.route).toList();

    return Scaffold(
      backgroundColor: Color(0xFF2D2D2D),
      appBar: Header(),
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: EdgeInsetsGeometry.only(
                    top: height * 0.01,
                    bottom: height * 0.02,
                    left: width * 0.08,
                    right: width * 0.08,
                  ),
                  sliver: SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleText(text: titleText),
                        FilterSearchButton(text: Strings.filterSearch, aspectRatio: 8,),
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsetsGeometry.only(
                    bottom: height * 0.02,
                    left: width * 0.08,
                    right: width * 0.08,
                  ),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => PhotoDisplay(photo: photos[index]),
                      childCount: photos.length,
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      childAspectRatio: 4 / 5,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.08, bottom: 30),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: GoBackButton(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
