import 'package:castronet/models/post.model.dart';
import 'package:castronet/widgets/ctn_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ViewPostPage extends StatefulWidget {
  PostModel post;

  ViewPostPage({
    this.post,
  });

  @override
  _ViewPostPageState createState() => _ViewPostPageState();
}

class _ViewPostPageState extends State<ViewPostPage> {
  int getLikeCount(likes) {
    int count = 0;
    if (likes == null) {
      return count;
    } else {
      likes.values.forEach((val) {
        if (val == true) {
          count += 1;
        }
      });
      return count;
    }
  }

  postImage() {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 400,
            child: ctnImageWidget(widget.post.mediaUrl),
          ),
        ),
      ],
    );
  }

  postInfoTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              widget.post.title ?? "",
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

  postInfoDescription() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              widget.post.description ?? "",
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
        actions: <Widget>[
          IconButton(
            icon: Icon(
              MdiIcons.fileEdit,
              size: 32,
              color: Colors.white,
            ),
            onPressed: null,
          ),
        ],
        centerTitle: true,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          postImage(),
          postInfoTitle(),
          postInfoDescription(),
        ],
      ),
    );
  }
}
