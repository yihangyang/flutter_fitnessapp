
// import 'package:fitness_app/screens/welcome/welcome_screen.dart';
import 'package:fitness_app/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        fontFamily: "Cairo",
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
      ),
      home: HomeScreen(),
      // home: WelcomeScreen(),
    );
  }
}
