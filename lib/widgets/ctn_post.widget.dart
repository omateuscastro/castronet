import 'package:castronet/models/post.model.dart';
import 'package:castronet/widgets/ctn_image_widget.dart';
import 'package:flutter/material.dart';

class PostWidget extends StatefulWidget {
  PostModel post;

  PostWidget({
    this.post,
  });

  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
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
        ctnImageWidget(widget.post.mediaUrl),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    widget.post.likesCount = getLikeCount(widget.post.likes);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[postImage()],
    );
  }
}
