import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared/category_class.dart';

class CategorySelector extends StatelessWidget {
  const CategorySelector({required this.selected, required this.category,required this.color, super.key});

  final Category category;
  final ValueChanged<Category> selected;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: (){
        selected(category);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadiusGeometry.circular(10),
          color: color,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.03,
            vertical: width * 0.01,
          ),
          child: Text(
            category.name.toUpperCase(),
            style: GoogleFonts.leagueGothic(
              color: Colors.white,
              fontSize: width * 0.04,
              height: 1,
            ),
          ),
        ),
      ),
    );
  }
}
