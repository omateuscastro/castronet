import 'package:castronet/constants/type_auth.dart';
import 'package:castronet/pages/home.page.dart';
import 'package:castronet/pages/user.page.dart';
import 'package:castronet/services/auth.service.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                "CastroNet",
                style: TextStyle(
                  fontSize: 90,
                  fontFamily: 'Chewy',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: RaisedButton(
                  color: Theme.of(context).accentColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image(
                        image: AssetImage("images/google_logo.png"),
                        height: 35.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Text(
                          "Login com Google",
                          style: TextStyle(
                            fontSize: 28,
                            fontFamily:
                                Theme.of(context).textTheme.title.fontFamily,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  onPressed: () async {
                    var goPage;

                    TypeAuth authUser = await signInWithGoogle();

                    switch (authUser) {
                      case TypeAuth.auth:
                        goPage = HomePage();
                        break;
                      case TypeAuth.newUser:
                        goPage = UserPage();
                        break;
                      default:
                        _scaffoldKey.currentState.showSnackBar(
                          SnackBar(
                            content: Text(
                                'Ops... Não foi possível efetuar o login.'),
                            duration: Duration(seconds: 3),
                          ),
                        );
                        return;
                    }

                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (BuildContext context) => goPage),
                      ModalRoute.withName('/'),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
