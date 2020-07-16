
import 'package:fitness_app/screens/softwarestufe/stufe_screen.dart';
import 'package:fitness_app/viewmodel/initialize_provider.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/config/constants.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers:  providers,
      child: MyApp(),
    )
  );
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
      home: StufeScreen(),
      // home: WelcomeScreen(),
    );
  }
}
