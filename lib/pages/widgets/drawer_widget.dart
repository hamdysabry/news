import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/Shared_component/Themes/colors.dart';
import 'package:news/model/categgorie_model.dart';

import 'drawer_item.dart';

class DrawerWidget extends StatelessWidget {
  CategoryModel? selectedCategory;
  Function? onPresed;

  DrawerWidget(
      {super.key, required this.selectedCategory, required this.onPresed});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Container(
      width: mediaQuery.width * .7,
      color: Colors.white,
      child: Column(children: [
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: mediaQuery.height * .2,
          color: primaryColor,
          child: Text(
            "News App!",
            style: GoogleFonts.poppins(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        DrawerItem(
          title: "Categories",
          iconData: Icons.list,
          onclick: () {
            if (onPresed != null) {
              onPresed!();
            }
          },
        ),
        DrawerItem(
          title: "Setting",
          iconData: Icons.settings,
          onclick: () {},
        ),
      ]),
    );
  }
}
