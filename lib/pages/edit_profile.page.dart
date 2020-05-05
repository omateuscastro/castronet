import 'package:cached_network_image/cached_network_image.dart';
import 'package:castronet/controllers/user.controller.dart';
import 'package:castronet/models/user.model.dart';
import 'package:castronet/widgets/ctn_circularloading.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  UserController _userCtrl;
  UserModel editUser;

  TextEditingController displayNameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController bioCtrl = TextEditingController();

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  saveProfile() async {
    editUser.displayName = displayNameCtrl.text;
    editUser.email = emailCtrl.text;
    editUser.bio = bioCtrl.text;

    await _userCtrl.updateProfileData(editUser);
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text('Perfil Atualizado com Sucesso.'),
        duration: Duration(seconds: 4),
        backgroundColor: Colors.green,
      ),
    );
  }

  loadActualProfileData() async {
    editUser = await _userCtrl.getCurrentUserData();
    displayNameCtrl.text = editUser.displayName;
    emailCtrl.text = editUser.email;
    bioCtrl.text = editUser.bio;
  }

  userPhoto() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: CircleAvatar(
            radius: 80.0,
            backgroundColor: Colors.grey,
            backgroundImage:
                CachedNetworkImageProvider(_userCtrl.currentUser.photoUrl),
          ),
        ),
      ],
    );
  }

  usernameLabel() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            _userCtrl.currentUser.username,
            style: TextStyle(
              fontSize: 22,
              fontFamily: Theme.of(context).textTheme.title.fontFamily,
            ),
          ),
        ),
      ],
    );
  }

  displayNameField() {
    return Padding(
      padding: EdgeInsets.all(
        16,
      ),
      child: Container(
        child: TextField(
          controller: displayNameCtrl,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Nome",
            labelStyle: TextStyle(fontSize: 16.0),
            hintText: "Digite seu nome.",
          ),
        ),
      ),
    );
  }

  emailField() {
    return Padding(
      padding: EdgeInsets.all(
        16,
      ),
      child: Container(
        child: TextField(
          controller: emailCtrl,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "E-mail",
            labelStyle: TextStyle(fontSize: 16.0),
            hintText: "Digite seu e-mail.",
          ),
        ),
      ),
    );
  }

  bioField() {
    return Padding(
      padding: EdgeInsets.all(
        16,
      ),
      child: Container(
        child: TextField(
          controller: bioCtrl,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Bio",
            labelStyle: TextStyle(fontSize: 16.0),
            hintText: "Digite sua bio.",
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _userCtrl = UserController();
    loadActualProfileData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          "Editar Perfil",
          style: TextStyle(
            fontFamily: Theme.of(context).textTheme.title.fontFamily,
            color: Colors.white,
            fontSize: 32,
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              MdiIcons.contentSave,
              size: 32,
              color: Colors.white,
            ),
            onPressed: saveProfile,
          ),
        ],
      ),
      body: Observer(
        name: "loadingUserInfo",
        builder: (_) => _userCtrl.loading
            ? ListView(
                children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        userPhoto(),
                        usernameLabel(),
                        displayNameField(),
                        emailField(),
                        bioField(),
                      ],
                    ),
                  ),
                ],
              )
            : ctnCircularLoadingWidget(context),
      ),
    );
  }
}
