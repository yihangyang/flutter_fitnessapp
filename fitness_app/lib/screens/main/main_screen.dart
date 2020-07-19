import 'package:fitness_app/screens/home/home_screen.dart';
import 'package:fitness_app/screens/news/news_screen.dart';
import 'package:fitness_app/screens/profile/login/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.tags),
      title: Text('Excerises'),
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.search),
      title: Text('Category'),
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.news),
      title: Text('News'),
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.profile_circled),
      title: Text('Me'),
    ),
  ];
  final List tabBodies = [
    HomeScreen(),
    HomeScreen(),
    NewsScreen(),
    LoginScreen(),
  ];
  int curIndex = 0;
  var curPage;

  @override
  void initState() {
    curPage = tabBodies[curIndex];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 255, 246),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: curIndex,
        items: bottomTabs,
        onTap: (index) {
          setState(() {
            curIndex = index;
            curPage = tabBodies[curIndex];
          });
        },
      ),
      body: curPage,
    );
  }
}