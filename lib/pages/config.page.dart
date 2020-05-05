import 'package:castronet/pages/edit_profile.page.dart';
import 'package:castronet/pages/login.page.dart';
import 'package:castronet/services/auth.service.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ConfigPage extends StatefulWidget {
  @override
  _ConfigPageState createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  logoff() {
    signOutGoogle().whenComplete(() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return LoginPage();
          },
        ),
      );
    });
  }

  goToEditProfile() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return EditProfilePage();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Configurações",
          style: TextStyle(
            fontFamily: Theme.of(context).textTheme.title.fontFamily,
            color: Colors.white,
            fontSize: 32,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Card(
              child: ListTile(
                leading: Icon(
                  MdiIcons.accountEdit,
                  size: 40.0,
                ),
                title: Text('Editar Perfil'),
                onTap: goToEditProfile,
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(
                  MdiIcons.exitToApp,
                  size: 40.0,
                ),
                title: Text('Sair'),
                onTap: logoff,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
