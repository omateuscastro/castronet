import 'package:castronet/constants/type_auth.dart';
import 'package:castronet/pages/login.page.dart';
import 'package:castronet/pages/home.page.dart';
import 'package:castronet/pages/user.page.dart';
import 'package:castronet/services/auth.service.dart';
import 'package:flutter/material.dart';

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

    TypeAuth authUser = await signInWithGoogleSilently();

    switch (authUser) {
      case TypeAuth.auth:
        goPage = HomePage();
        break;
      case TypeAuth.newUser:
        goPage = UserPage();
        break;
      default:
        goPage = LoginPage();
        break;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => goPage),
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
