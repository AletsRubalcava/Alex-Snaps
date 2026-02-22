import 'package:alex_snaps/app_content/strings.dart';
import 'package:alex_snaps/gallery/filter_search_button.dart';
import 'package:alex_snaps/general/title_text.dart';
import 'package:alex_snaps/widgets/buttons/full_colored_photo_button.dart';
import 'package:alex_snaps/widgets/buttons/gradient_photo_button.dart';
import 'package:flutter/material.dart';

class MainGalleryPageListView extends StatelessWidget {
  const MainGalleryPageListView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final photo = [
      'assets/images/dummy.jpg',
      'assets/images/dummy.jpg',
      'assets/images/dummy.jpg',
    ];

    final name = [
      'VASCONCELOS',
      'WILDLIFE',
      'VERACRUZ',
    ];

    final cat = [
      'Vasconcelos',
      'Wildlife',
      'Veracruz'
    ];

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
                    FilterSearchButton(text: Strings.filterSearch),
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
              sliver: SliverToBoxAdapter(child: FullColoredPhotoButton(text: Strings.mainGalleryButton)),
            ),
            SliverPadding(
              padding: EdgeInsetsGeometry.only(
                bottom: height * 0.02,
                left: width * 0.08,
                right: width * 0.08,
              ),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                      (context, index) => GradientPhotoButton(photo: photo[index], text: name[index], category: cat[index]),
                  childCount: photo.length,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 4/5
                ),
              ),
            ),
          ]
        )
      ),
    );
  }
}
