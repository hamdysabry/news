import 'package:flutter/material.dart';
import 'package:news/model/source_model.dart';

class TabItem extends StatelessWidget {
  Source source;

  bool isSelected;

  TabItem(this.source, this.isSelected, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: isSelected ? Colors.green : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.green)),
      child: Text(
        source.name ?? "",
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.green,
        ),
      ),
    );
  }
}
