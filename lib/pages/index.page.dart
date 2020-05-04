import 'package:castronet/constants/type_auth.dart';
import 'package:castronet/pages/login.page.dart';
import 'package:castronet/pages/home.page.dart';
import 'package:castronet/pages/user.page.dart';
import 'package:castronet/services/auth.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              'images/network.svg',
              height: 300.0,
              color: Theme.of(context).primaryColor,
            ),
            Center(
              child: Text(
                "CastroNet",
                style: TextStyle(
                  fontSize: 90,
                  fontFamily: Theme.of(context).textTheme.title.fontFamily,
                  color: Theme.of(context).primaryColor,
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
