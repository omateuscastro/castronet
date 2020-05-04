import 'package:flutter/material.dart';

AppBar ctnAppBar(context, String titleText) {
  return AppBar(
    title: Text(
      titleText,
      style: TextStyle(
        fontFamily: Theme.of(context).textTheme.title.fontFamily,
        color: Colors.white,
        fontSize: 32,
      ),
    ),
    centerTitle: true,
  );
}
