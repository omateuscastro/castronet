import 'package:castronet/models/post.model.dart';
import 'package:castronet/pages/posts/view_post.page.dart';
import 'package:castronet/widgets/ctn_image_widget.dart';
import 'package:flutter/material.dart';

class CtnMiniPostWidget extends StatelessWidget {
  final PostModel post;

  CtnMiniPostWidget(this.post);

  goToPost(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ViewPostPage(
          post: post,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => goToPost(context),
      child: ctnImageWidget(post.mediaUrl),
    );
  }
}
