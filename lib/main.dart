import 'package:castronet/pages/index.page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CastroNet',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.cyan,
          accentColor: Colors.blue[900],
          textTheme: TextTheme(
              title: TextStyle(
            fontFamily: 'Chewy',
          ))),
      home: IndexPage(),
    );
  }
}
