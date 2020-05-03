import 'package:flutter/material.dart';
import 'package:castronet/services/auth.service.dart';
import 'package:castronet/pages/login.page.dart';

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Post",
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
            Center(
              child: Text(
                "CastroNet",
                style: TextStyle(
                  fontSize: 90,
                  fontFamily: Theme.of(context).textTheme.title.fontFamily,
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
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Center(
                          child: Text(
                            "Sair",
                            style: TextStyle(
                              fontSize: 28,
                              fontFamily:
                                  Theme.of(context).textTheme.title.fontFamily,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {
                    signOutGoogle().whenComplete(() {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return LoginPage();
                          },
                        ),
                      );
                    });
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
