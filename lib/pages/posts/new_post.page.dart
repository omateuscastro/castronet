import 'package:castronet/controllers/post.controller.dart';
import 'package:castronet/controllers/user.controller.dart';
import 'package:castronet/widgets/ctn_app_bar.widget.dart';
import 'package:castronet/widgets/ctn_fab_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_svg/svg.dart';

class NewPostPage extends StatefulWidget {
  @override
  _NewPostPageState createState() => _NewPostPageState();
}

class _NewPostPageState extends State<NewPostPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  UserController _userCtrl;
  PostController _postCtrl;
  TextEditingController titleCtrl = TextEditingController();
  TextEditingController descriptionCtrl = TextEditingController();

  newPost() {
    _postCtrl.newPost();
    _postCtrl.resetImage();
    titleCtrl.clear();
    descriptionCtrl.clear();
    _postCtrl.changeFormVisibility(true);
  }

  cancelPost() {
    _postCtrl.changeFormVisibility(false);
  }

  savePost(context) async {
    if (_postCtrl.image != null) {
      _postCtrl.setUploadPostStatus(true);

      await _postCtrl.createPostInFirestore(
          _userCtrl.currentUser, titleCtrl.text, descriptionCtrl.text);

      _postCtrl.changeFormVisibility(false);
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('Post criado com sucesso!'),
          duration: Duration(seconds: 4),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content:
              Text('Para fazer uma postagem e necessário incluir uma imagem.'),
          duration: Duration(seconds: 4),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _userCtrl = UserController();
    _userCtrl.getCurrentUserData();

    _postCtrl = PostController();
    _postCtrl.setUploadPostStatus(false);
    _postCtrl.changeFormVisibility(false);
  }

  Scaffold postPage(context) {
    final Orientation orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      key: _scaffoldKey,
      appBar: ctnAppBar(context, "Post"),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              'images/post.svg',
              height: orientation == Orientation.portrait ? 300.0 : 200.0,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Theme.of(context).accentColor,
                  child: Text(
                    "Nova Postagem",
                    style: TextStyle(
                      fontSize: 28,
                      fontFamily: Theme.of(context).textTheme.title.fontFamily,
                      color: Colors.white,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(26.0),
                  ),
                  onPressed: newPost,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  postForm(context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            MdiIcons.arrowLeft,
            size: 32,
            color: Colors.white,
          ),
          onPressed: cancelPost,
        ),
        title: Text(
          "Novo Post",
          style: TextStyle(
            fontFamily: Theme.of(context).textTheme.title.fontFamily,
            color: Colors.white,
            fontSize: 32,
          ),
        ),
        actions: <Widget>[
          Observer(
            builder: (_) {
              return IconButton(
                icon: Icon(
                  MdiIcons.contentSave,
                  size: 32,
                  color: Colors.white,
                ),
                onPressed: _postCtrl.uploadingPost
                    ? null
                    : () {
                        savePost(context);
                      },
              );
            },
          ),
        ],
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Observer(
            builder: (_) => _postCtrl.uploadingPost
                ? Container(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: LinearProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.purple),
                    ),
                  )
                : SizedBox(),
          ),
          Observer(
            builder: (_) => _postCtrl.image != null
                ? Container(
                    height: 220,
                    width: MediaQuery.of(context).size.width * 1,
                    child: Center(
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              fit: BoxFit.cover,
                              image: FileImage(_postCtrl.image),
                            )),
                          ),
                        ),
                      ),
                    ))
                : Container(
                    height: 220,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SizedBox(
                        width: double.infinity,
                        height: 60,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                MdiIcons.image,
                                size: 32,
                                color: Colors.white,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 18.0),
                                child: Text(
                                  "Adicione uma imagem.",
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontFamily: Theme.of(context)
                                        .textTheme
                                        .title
                                        .fontFamily,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
          ),
          SizedBox(
            height: 10,
          ),
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
        ],
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          CtnFabImageWidget(
            postCtrl: _postCtrl,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) =>
          _postCtrl.formVisibility ? postForm(context) : postPage(context),
    );
  }
}
