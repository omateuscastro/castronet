import 'package:castronet/pages/login.page.dart';
import 'package:castronet/pages/home.page.dart';
import 'package:castronet/services/auth.service.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  bool isAuth = false;

  @override
  void initState() {
    super.initState();
    checkAuth();
  }

  checkAuth() async {
    var goPage;

    var authUser = await signInWithGoogleSilently();

    if (authUser != null) {
      goPage = HomePage();
    } else {
      goPage = LoginPage();
    }

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return goPage;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue[100],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                "CastroNet",
                style: TextStyle(
                  fontSize: 90,
                  fontFamily: Theme.of(context).textTheme.title.fontFamily,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 10.0),
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(
                  Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
