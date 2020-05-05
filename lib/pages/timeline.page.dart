import 'package:castronet/services/auth.service.dart';
import 'package:castronet/pages/login.page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

final usersRef = Firestore.instance.collection("users");

class TimelinePage extends StatefulWidget {
  @override
  _TimelinePageState createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePage> {
  updateFeed() {
    print("Atualizar o feed");
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Timeline",
          style: TextStyle(
            fontFamily: Theme.of(context).textTheme.title.fontFamily,
            color: Colors.white,
            fontSize: 32,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset('images/timeline.svg', height: 300.0),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Theme.of(context).accentColor,
                  child: Text(
                    "Atualizar o feed",
                    style: TextStyle(
                      fontSize: 28,
                      fontFamily: Theme.of(context).textTheme.title.fontFamily,
                      color: Colors.white,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(26.0),
                  ),
                  onPressed: updateFeed(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
