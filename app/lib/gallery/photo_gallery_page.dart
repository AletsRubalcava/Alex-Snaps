import 'package:alex_snaps/gallery/filter_search_button.dart';
import 'package:alex_snaps/general/header.dart';
import 'package:alex_snaps/general/title_text.dart';
import 'package:flutter/material.dart';
import 'package:alex_snaps/widgets/photo_display.dart';
import 'package:alex_snaps/app_content/strings.dart';
import 'package:alex_snaps/photo_repository.dart';
import 'package:shared/photo_class.dart';

class GalleryPhotoPage extends StatefulWidget {
  const GalleryPhotoPage({required this.category, this.text, super.key});

  final String? text;
  final String? category;

  @override
  State<GalleryPhotoPage> createState() => _GalleryPhotoPageState();

}

class _GalleryPhotoPageState extends State<GalleryPhotoPage> {
  //Since loadDatabase() is async, we need to use a future.
  late Future<PhotoRepository> pr;

  @override
  void initState(){
    super.initState();
    pr = loadDatabase();
  }

  //Since load() is async, loadDatabase() is also async.
  Future<PhotoRepository> loadDatabase() async{
    final db = PhotoRepository();
    await db.load();
    return db;
  }

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final titleText = widget.text ?? Strings.galleryPageTitle;

    //Builds ui depending on a future variable
    return FutureBuilder<PhotoRepository>(
      future: pr,
      //Snapshot is the state of the future
      builder: (context, snapshot){

        //If future is not done yet
        if(snapshot.connectionState == ConnectionState.waiting){
          return Scaffold(
            backgroundColor: Color(0xFF2D2D2D),
              appBar: Header(),
              body: SafeArea(
                child: Padding(
                  padding: EdgeInsetsGeometry.only(
                    top: height * 0.01,
                    bottom: height * 0.02,
                    left: width * 0.08,
                    right: width * 0.08,
                  ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleText(text: titleText),
                        FilterSearchButton(text: Strings.filterSearch),
                      ],
                    ),
                ),
              )
          );
        }

        //If future has an error
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
        late final List<Photo> photo;

        if(widget.category != null){
          photo = db.photos.values.where((photo) => photo.categories.contains(widget.category)).toList();
        }else{
          photo = db.photos.values.toList();
          photo.sort((a, b) => a.order.compareTo(b.order));
        }

        final photos = photo.map((photo) => photo.route).toList();

        return Scaffold(
          backgroundColor: Color(0xFF2D2D2D),
          appBar: Header(),
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
                        TitleText(text: titleText),
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