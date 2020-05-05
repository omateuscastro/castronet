import 'package:castronet/controllers/user.controller.dart';
import 'package:castronet/models/user.model.dart';
import 'package:castronet/pages/config.page.dart';
import 'package:castronet/widgets/ctn_circularloading.widget.dart';
import 'package:castronet/widgets/ctn_grid_view_widget.dart';
import 'package:castronet/widgets/ctn_mini_post.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  UserController _userCtrl;

  @override
  void initState() {
    super.initState();
    _userCtrl = UserController();
  }

  goToConfig() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) => ConfigPage()));
  }

  profilePhoto(photoUrl) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          radius: 100.0,
          backgroundColor: Colors.grey,
          backgroundImage: CachedNetworkImageProvider(photoUrl),
        ),
      ],
    );
  }

  usernameLabel(displayName) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              displayName ?? "",
              style: TextStyle(
                fontSize: 20,
                fontFamily: Theme.of(context).textTheme.title.fontFamily,
              ),
            ),
          ),
        ),
      ],
    );
  }

  displayNameLabel(displayName) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            displayName ?? "",
            style: TextStyle(
              fontSize: 22,
              fontFamily: Theme.of(context).textTheme.title.fontFamily,
            ),
          ),
        ),
      ],
    );
  }

  bioLabel(bio) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            bio ?? "",
            style: TextStyle(
              fontSize: 18,
              fontFamily: Theme.of(context).textTheme.title.fontFamily,
            ),
          ),
        ),
      ],
    );
  }

  posts(postCount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            "Quantidade de posts : $postCount",
            style: TextStyle(
              fontSize: 18,
              fontFamily: Theme.of(context).textTheme.title.fontFamily,
            ),
          ),
        ),
      ],
    );
  }

  postsList(posts) {
    List<GridTile> gridItems = [];

    posts.forEach((post) {
      gridItems.add(GridTile(child: CtnMiniPostWidget(post)));
    });

    return ctnGridViewWidget(gridItems);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Perfil",
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
              MdiIcons.tools,
              size: 32,
              color: Colors.white,
            ),
            onPressed: goToConfig,
          ),
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            FutureBuilder(
              future: _userCtrl.getCurrentUserData(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return ctnCircularLoadingWidget(context);
                }
                UserModel user = snapshot.data;
                return Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          profilePhoto(user.photoUrl),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              usernameLabel(user.username),
                              displayNameLabel(user.displayName),
                              bioLabel(user.bio),
                            ],
                          )
                        ],
                      ),
                      Divider(),
                      posts(user.postCount),
                      Divider(),
                      postsList(user.posts),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
