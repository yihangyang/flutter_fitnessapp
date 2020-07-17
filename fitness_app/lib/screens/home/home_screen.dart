import 'package:fitness_app/screens/home/components/home_content.dart';
import 'package:fitness_app/screens/home/components/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: HomeContent()
    );
  }
}
