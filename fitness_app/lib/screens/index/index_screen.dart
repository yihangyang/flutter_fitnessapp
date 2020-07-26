import 'package:fitness_app/screens/home/home_screen.dart';
import 'package:fitness_app/screens/news/news_screen.dart';
import 'package:fitness_app/screens/profile/login/login_screen.dart';
import 'package:fitness_app/screens/video/video_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IndexScreen extends StatefulWidget {
  @override
  _IndexScreenState createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.tags),
      title: Text('Excerises'),
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.play_arrow),
      title: Text('Ytb'),
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
    VideoScreen(),
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