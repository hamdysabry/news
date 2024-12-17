import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/pages/category_view.dart';
import 'package:news/pages/widgets/drawer_widget.dart';

import '../model/categgorie_model.dart';
import '../model/gridview_item_category.dart';

class homeScreen extends StatefulWidget {
  static const String routeName = "home_page";

  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  List<CategoryModel> categoriesList = [
    CategoryModel(
        id: "sports",
        title: "Sports",
        backGroundColor: const Color(0XFFC91C22),
        image: "assets/images/sports.png"),
    CategoryModel(
        id: "politics",
        title: "Politics",
        backGroundColor: const Color(0XFF003E90),
        image: "assets/images/Politics.png"),
    CategoryModel(
        id: "health",
        title: "Health",
        backGroundColor: const Color(0XFFED1E79),
        image: "assets/images/health.png"),
    CategoryModel(
        id: "business",
        title: "Business",
        backGroundColor: const Color(0XFFCF7E48),
        image: "assets/images/bussines.png"),
    CategoryModel(
        id: "environment",
        title: "Environment",
        backGroundColor: const Color(0XFF4882CF),
        image: "assets/images/environment.png"),
    CategoryModel(
        id: "science",
        title: "Science",
        backGroundColor: const Color(0XFFF2D352),
        image: "assets/images/science.png"),
  ];
  CategoryModel? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage("assets/images/pattern.png"),
            fit: BoxFit.cover,
          )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          title: Padding(
            padding: const EdgeInsets.all(60.0),
            child: Text(
              selectedCategory == null ? "News App" : selectedCategory!.title,
              style: GoogleFonts.poppins(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        drawer: DrawerWidget(
          selectedCategory: selectedCategory,
          onPresed: () {
            setState(() {
              selectedCategory = null;
              Navigator.pop(context);
            });
          },
        ),
        body: selectedCategory == null
            ? Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                              childAspectRatio: 7 / 8),
                      itemBuilder: (context, index) => GridviewItemWidget(
                        categoryModel: categoriesList[index],
                        index: index,
                        onClicked: (categoryModel) {
                          selectedCategory = categoryModel;
                          setState(() {});
                        },
                      ),
                      itemCount: categoriesList.length,
                    ))
                  ],
                ),
              )
            : CategoryView(selected: selectedCategory!),
      ),
    );
  }
}
