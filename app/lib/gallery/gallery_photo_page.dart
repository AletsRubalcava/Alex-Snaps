import 'package:alex_snaps/gallery/filter_search_button.dart';
import 'package:alex_snaps/general/header.dart';
import 'package:alex_snaps/general/title_text.dart';
import 'package:flutter/material.dart';
import 'package:alex_snaps/widgets/photo_display.dart';
import 'package:alex_snaps/app_content/strings.dart';
import 'package:alex_snaps/photo_repository.dart';

class GalleryPhotoPage extends StatefulWidget {
  const GalleryPhotoPage({super.key});

  @override
  State<GalleryPhotoPage> createState() => _GalleryPhotoPageState();

}

class _GalleryPhotoPageState extends State<GalleryPhotoPage> {
  late Future<PhotoRepository> pr;

  @override
  void initState(){
    super.initState();
    pr = loadDatabase();
  }

  Future<PhotoRepository> loadDatabase() async{
    final db = PhotoRepository();
    await db.load();
    print(db.photos.length);
    return db;
  }

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return FutureBuilder<PhotoRepository>(
      future: pr,
      builder: (context, snapshot){

        if(snapshot.connectionState == ConnectionState.waiting){
          return const Scaffold(
            backgroundColor: Color(0xFF2D2D2D),
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if(snapshot.hasError){
          return Scaffold(
            backgroundColor: const Color(0xFF2D2D2D),
            body: Center(
              child: Text(
                'Error loading database',
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        }
        final db = snapshot.data!;
        final photo = db.photos.values.toList();
        photo.sort((a, b) => a.order.compareTo(b.order));
        final photos = photo.map((photo) => photo.route).toList();

        return Scaffold(
          backgroundColor: Color(0xFF2D2D2D),
          appBar: Header(),
          body: SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: EdgeInsetsGeometry.only(
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
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                          (context, index) => PhotoDisplay(photo: photos[index]),
                      childCount: photos.length,
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        childAspectRatio: 4/5
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}