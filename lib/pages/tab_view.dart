import 'package:flutter/material.dart';
import 'package:news/model/source_model.dart';
import 'package:news/pages/widgets/articl_list_view.dart';
import 'package:news/pages/widgets/tab_item.dart';

class TabBarListView extends StatefulWidget {
  List<Source> sources;

  TabBarListView(this.sources, {super.key});

  @override
  State<TabBarListView> createState() => _TabBarListViewState();
}

class _TabBarListViewState extends State<TabBarListView> {
  static int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          DefaultTabController(
              length: widget.sources.length ?? 0,
              child: TabBar(
                  dividerHeight: 0,
                  labelPadding: const EdgeInsets.symmetric(horizontal: 6),
                  indicator: const BoxDecoration(),
                  onTap: (index) {
                    selectedIndex = index;
                    setState(() {});
                  },
                  isScrollable: true,
                  tabs: widget.sources.map((element) {
                    return TabItem(
                        element,
                        selectedIndex == widget.sources.indexOf(element)
                            ? true
                            : false);
                  }).toList())),
          ArticlsListView(widget.sources[selectedIndex].id ?? ""),
        ],
      ),
    );
  }
}
