import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/constant.dart';
import 'package:movieapp/pages/movie_content.dart';

class MoviePage extends StatefulWidget {
  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  int currentPage = 0;
  GlobalKey bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constant.movies),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
          child: _getPage(currentPage),
        ),
      ),
      bottomNavigationBar: bottomNavigation(),
    );
  }

  _getPage(int page) {
    switch (page) {
      case 0:
        return MovieContent(Constant.cardLowerCase);
      case 1:
        return MovieContent(Constant.gridLowerCase);
      case 2:
        return MovieContent(Constant.listLowerCase);
    }
  }

  Widget bottomNavigation() {
    return FancyBottomNavigation(
      tabs: [
        TabData(
            iconData: Icons.home,
            title: Constant.cardUpperCase,
            onclick: () {
              _getPage(0);
            }),
        TabData(
            iconData: Icons.shopping_cart,
            title: Constant.gridUpperCase,
            onclick: () {
              _getPage(1);
            }),
        TabData(
            iconData: Icons.account_circle,
            title: Constant.listUpperCase,
            onclick: () {
              _getPage(2);
            })
      ],
      initialSelection: 0,
      key: bottomNavigationKey,
      onTabChangedListener: (position) {
        setState(() {
          currentPage = position;
        });
      },
    );
  }
}
