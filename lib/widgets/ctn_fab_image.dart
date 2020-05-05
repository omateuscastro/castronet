import 'dart:io';

import 'package:castronet/controllers/post.controller.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CtnFabImageWidget extends StatefulWidget {
  final PostController postCtrl;

  CtnFabImageWidget({
    this.postCtrl,
  });

  @override
  _CtnFabImageWidgetState createState() => _CtnFabImageWidgetState();
}

class _CtnFabImageWidgetState extends State<CtnFabImageWidget>
    with SingleTickerProviderStateMixin {
  bool isOpened = false;
  AnimationController _animationController;
  Animation<Color> _buttonColor;
  Animation<double> _animateIcon;
  Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 70.0;

  @override
  initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() {
            setState(() {});
          });
    _animateIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _buttonColor = ColorTween(
      begin: Colors.cyan,
      end: Colors.red,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.00,
        1.00,
        curve: Curves.linear,
      ),
    ));
    _translateButton = Tween<double>(
      begin: _fabHeight,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        0.75,
        curve: _curve,
      ),
    ));
    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  animate() {
    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    isOpened = !isOpened;
  }

  takePhoto() async {
    File file = await ImagePicker.pickImage(
      source: ImageSource.camera,
      imageQuality: 85,
      maxHeight: 480,
      maxWidth: 640,
    );
    widget.postCtrl.setImage(file);
  }

  chooseFromGallery() async {
    File file = await ImagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
      maxHeight: 480,
      maxWidth: 640,
    );
    widget.postCtrl.setImage(file);
  }

  Widget camera() {
    return Container(
        child: Padding(
      child: FloatingActionButton(
        tooltip: 'Capturar Imagem',
        child: Icon(
          Icons.camera_alt,
          color: Colors.white,
        ),
        onPressed: () {
          takePhoto();
        },
      ),
      padding: EdgeInsets.only(bottom: 14.0),
    ));
  }

  Widget gallery() {
    return Container(
        child: Padding(
      child: FloatingActionButton(
        onPressed: () {
          chooseFromGallery();
        },
        tooltip: 'Escolher Imagem da Galeria',
        child: Icon(
          Icons.image,
          color: Colors.white,
        ),
      ),
      padding: EdgeInsets.only(bottom: 14.0),
    ));
  }

  Widget toggle() {
    return Container(
      child: FloatingActionButton(
        backgroundColor: _buttonColor.value,
        onPressed: animate,
        tooltip: 'Nova Imagem do Empregado',
        child: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          color: Colors.white,
          progress: _animateIcon,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value * 2.0,
            0.0,
          ),
          child: camera(),
        ),
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value,
            0.0,
          ),
          child: gallery(),
        ),
        toggle(),
      ],
    );
  }
}
