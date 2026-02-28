import 'package:alex_snaps/app_content/assets.dart';
import 'package:alex_snaps/app_content/strings.dart';
import 'package:alex_snaps/gallery/filter_search_button.dart';
import 'package:alex_snaps/general/title_text.dart';
import 'package:alex_snaps/photo_repository.dart';
import 'package:alex_snaps/widgets/buttons/full_colored_photo_button.dart';
import 'package:alex_snaps/widgets/buttons/gradient_photo_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared/category_class.dart';

class MainGalleryPageListView extends StatefulWidget {
  const MainGalleryPageListView({super.key});

  @override
  State<StatefulWidget> createState() => _MainGalleryPageListView();
}

class _MainGalleryPageListView extends State<MainGalleryPageListView> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final db = context.read<PhotoRepository>();
    final tmpButtons = db.categories.values.toList();
    final List<Category> buttons;

    if (tmpButtons.length % 2 != 0) {
      buttons = tmpButtons.sublist(0, tmpButtons.length - 1);
    } else {
      buttons = tmpButtons;
    }

    return Scaffold(
          backgroundColor: Color(0xFF2D2D2D),
          body: SafeArea(
            child: CustomScrollView(
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
                        TitleText(text: Strings.galleryPageTitle),
                        FilterSearchButton(text: Strings.filterSearch, aspectRatio: 8),
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
                  sliver: SliverToBoxAdapter(
                    child: FullColoredPhotoButton(
                      text: Strings.mainGalleryButton,
                      photo: Assets.images.mainGalleryButton,
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
                      (context, index) => GradientPhotoButton(
                        photo: db.thumbs[buttons[index].thumbId]!.route,
                        category: buttons[index].name,
                        text: buttons[index].name.toUpperCase(),
                      ),
                      childCount: buttons.length,
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      childAspectRatio: 1,
                    ),
                  ),
                ),
                if (tmpButtons.length % 2 != 0) ...[
                  SliverPadding(
                    padding: EdgeInsetsGeometry.only(
                      bottom: height * 0.02,
                      left: width * 0.08,
                      right: width * 0.08,
                    ),
                    sliver: SliverToBoxAdapter(
                      child: FullColoredPhotoButton(
                        text: tmpButtons.last.name.toUpperCase(),
                        photo: db.thumbs[tmpButtons.last.thumbId]!.route,
                        category: tmpButtons.last.name,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        );
  }
}
