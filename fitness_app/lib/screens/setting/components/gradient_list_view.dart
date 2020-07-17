import 'package:fitness_app/screens/setting/setting_screen.dart';
import 'package:flutter/material.dart';

class GradientListview extends StatelessWidget {
  const GradientListview({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          GradientCard('Productivity', '102 Products',
              [pinkGradient1, pinkGradient2]),
          GradientCard('Design', '82 Products',
              [blueGradient1, blueGradient2]),
          GradientCard('Productivity', '102 Products',
              [pinkGradient1, pinkGradient2]),
          GradientCard('Design', '82 Products',
              [blueGradient1, blueGradient2]),
        ],
      ),
    );
  }
}