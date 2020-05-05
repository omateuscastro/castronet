import 'package:flutter/material.dart';

Container ctnCircularLoadingWidget(context) {
  return Container(
    alignment: Alignment.center,
    padding: EdgeInsets.only(top: 10.0),
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(
        Theme.of(context).primaryColor,
      ),
    ),
  );
}
