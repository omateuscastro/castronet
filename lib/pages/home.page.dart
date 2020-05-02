import 'package:castronet/pages/post.page.dart';
import 'package:castronet/pages/profile.page.dart';
import 'package:castronet/pages/timeline.page.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageCtrl;
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
    pageCtrl = PageController(
      initialPage: 0,
    );
  }

  onPageChanged(int pageId) {
    setState(() {
      this.pageIndex = pageId;
    });
  }

  goToPage(int pageId) {
    pageCtrl.animateToPage(
      pageId,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: <Widget>[
          TimelinePage(),
          PostPage(),
          ProfilePage(),
        ],
        controller: pageCtrl,
        onPageChanged: onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: pageIndex,
          onTap: goToPage,
          selectedItemColor: Theme.of(context).accentColor,
          items: [
            BottomNavigationBarItem(
              title: Text("Timeline"),
              icon: Icon(
                MdiIcons.timeline,
                size: 32,
              ),
            ),
            BottomNavigationBarItem(
              title: Text("AddPost"),
              icon: Icon(
                MdiIcons.plusCircle,
                size: 42,
              ),
            ),
            BottomNavigationBarItem(
              title: Text("Perfil"),
              icon: Icon(
                MdiIcons.account,
                size: 32,
              ),
            )
          ]),
    );
  }

  @override
  void dispose() {
    pageCtrl.dispose();
    super.dispose();
  }
}
