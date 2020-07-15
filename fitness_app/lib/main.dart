
// import 'package:fitness_app/screens/welcome/welcome_screen.dart';
import 'package:fitness_app/screens/home/home_screen.dart';
import 'package:fitness_app/screens/funiture/funiture_screen.dart';
import 'package:fitness_app/screens/softwarestufe/softwarestufe_screen.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/config/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fitness App',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        fontFamily: "Cairo",
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(
          displayColor: kBlackColor
        ),
      ),
      home: SoftwarestufeScreen(),
      // home: WelcomeScreen(),
    );
  }
}
