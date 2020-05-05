import 'dart:async';

import 'package:castronet/controllers/post.controller.dart';
import 'package:castronet/models/post.model.dart';
import 'package:castronet/pages/profile.page.dart';
import 'package:castronet/widgets/ctn_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class EditPostPage extends StatefulWidget {
  PostModel post;

  EditPostPage({
    this.post,
  });

  @override
  _EditPostPageState createState() => _EditPostPageState();
}

class _EditPostPageState extends State<EditPostPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  PostController _postCtrl;
  TextEditingController titleCtrl = TextEditingController();
  TextEditingController descriptionCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _postCtrl = PostController();
    titleCtrl.text = widget.post.title;
    descriptionCtrl.text = widget.post.description;
  }

  editPost() async {
    await _postCtrl.updatePostInFirestore(
      widget.post.ownerId,
      widget.post.postId,
      titleCtrl.text,
      descriptionCtrl.text,
    );

    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text('Post editado com sucesso!'),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.green,
      ),
    );

    Timer(Duration(seconds: 2), () {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext context) => ProfilePage()),
        ModalRoute.withName('/'),
      );
    });
  }

  deletePost() async {
    await _postCtrl.deletePostInFirestore(
      widget.post.ownerId,
      widget.post.postId,
    );

    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text('Post excluído com sucesso!'),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.green,
      ),
    );

    Timer(Duration(seconds: 2), () {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext context) => ProfilePage()),
        ModalRoute.withName('/'),
      );
    });
  }

  headerEditPost() {
    return AppBar(
      title: Text(
        "Novo Post",
        style: TextStyle(
          fontFamily: Theme.of(context).textTheme.title.fontFamily,
          color: Colors.white,
          fontSize: 32,
        ),
      ),
      actions: <Widget>[
        IconButton(
            icon: Icon(
              MdiIcons.contentSave,
              size: 32,
              color: Colors.white,
            ),
            onPressed: editPost),
      ],
      centerTitle: true,
    );
  }

  postImage() {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            height: 300,
            child: ctnImageWidget(widget.post.mediaUrl),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: headerEditPost(),
        body: ListView(
          children: <Widget>[
            postImage(),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: TextField(
                controller: titleCtrl,
                decoration: InputDecoration(
                  hintText: "Título da Postagem",
                  border: InputBorder.none,
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: TextField(
                controller: descriptionCtrl,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: "Corpo da Postagem",
                  border: InputBorder.none,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.red,
                  child: Text(
                    "Excluir Postagem",
                    style: TextStyle(
                      fontSize: 26,
                      fontFamily: Theme.of(context).textTheme.title.fontFamily,
                      color: Colors.white,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(26.0),
                  ),
                  onPressed: deletePost,
                ),
              ),
            ),
          ],
        ));
  }
}
