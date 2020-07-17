import 'package:fitness_app/config/constants.dart';
import 'package:fitness_app/screens/softwarestufe/game_screen/game_content.dart';
import 'package:flutter/material.dart';

class GameScreen extends StatelessWidget {
  final int index;

  const GameScreen({Key key, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: kPrimaryColor,
      body: GameContent()
    );
  }
}