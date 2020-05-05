import 'package:flutter/material.dart';

GridView ctnGridViewWidget(gridItems) {
  return GridView.count(
    crossAxisCount: 4,
    childAspectRatio: 1.0,
    mainAxisSpacing: 1.5,
    crossAxisSpacing: 1.5,
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    children: gridItems,
  );
}
