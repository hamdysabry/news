import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerItem extends StatelessWidget {
  String title;
  IconData iconData;
  Function onclick;

  DrawerItem(
      {required this.title, required this.iconData, required this.onclick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onclick();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(
              iconData,
              size: 50,
            ),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
