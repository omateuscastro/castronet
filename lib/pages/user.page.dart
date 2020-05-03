import 'dart:async';

import 'package:castronet/controllers/user.controller.dart';
import 'package:castronet/pages/home.page.dart';
import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  String username;
  UserController _userCtrl;

  @override
  void initState() {
    super.initState();
    _userCtrl = UserController();
  }

  submit() async {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      await _userCtrl.saveNewUserData(username);

      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text('Usuário criado com sucesso!'),
          duration: Duration(seconds: 3),
          backgroundColor: Colors.green,
        ),
      );

      Timer(Duration(seconds: 2), () {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => HomePage()),
          ModalRoute.withName('/'),
        );
      });
    } else {
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text('Ops... Não foi possível criar o usuário.'),
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          "Criar Usuário",
          style: TextStyle(
            fontFamily: Theme.of(context).textTheme.title.fontFamily,
            color: Colors.white,
            fontSize: 32,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    top: 25,
                  ),
                  child: Center(
                    child: Text(
                      "Novo Usuário",
                      style: TextStyle(
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(
                    16,
                  ),
                  child: Container(
                    child: Form(
                      key: _formKey,
                      autovalidate: true,
                      child: TextFormField(
                        validator: (txt) {
                          if (txt.trim().length < 3 || txt.isEmpty) {
                            return "Username muito curto.";
                          } else if (txt.trim().length > 15) {
                            return "Username muito longo.";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (txt) => username = txt,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Username",
                          labelStyle: TextStyle(fontSize: 15.0),
                          hintText: "Minimo de 3 caracteres.",
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Theme.of(context).accentColor,
                      child: Text(
                        "Confirmar",
                        style: TextStyle(
                          fontSize: 28,
                          fontFamily:
                              Theme.of(context).textTheme.title.fontFamily,
                          color: Colors.white,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(26.0),
                      ),
                      onPressed: submit,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
