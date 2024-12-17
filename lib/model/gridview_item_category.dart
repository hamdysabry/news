import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/model/categgorie_model.dart';

class GridviewItemWidget extends StatelessWidget {
  CategoryModel categoryModel;
  Function onClicked;
  int index;

  GridviewItemWidget({
    super.key,
    required this.categoryModel,
    required this.onClicked,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClicked(categoryModel);
      },
      child: Container(
        decoration: BoxDecoration(
            color: categoryModel.backGroundColor,
            borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(25),
                topRight: const Radius.circular(25),
                bottomRight: index % 2 == 0
                    ? const Radius.circular(0)
                    : const Radius.circular(25),
                bottomLeft: index % 2 == 0
                    ? const Radius.circular(25)
                    : const Radius.circular(0))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(categoryModel.image),
            const SizedBox(
              height: 6,
            ),
            Text(
              categoryModel.title,
              style: GoogleFonts.exo(fontSize: 22, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
