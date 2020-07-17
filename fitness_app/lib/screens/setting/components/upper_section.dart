import 'package:fitness_app/screens/setting/components/setting_tile.dart';
import 'package:fitness_app/screens/setting/setting_screen.dart';
import 'package:flutter/material.dart';

class UpperSection extends StatelessWidget {
  const UpperSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: buttonColor.withOpacity(0.8),
      child: Column(
        children: <Widget>[
          SettingTile(
            title: 'Top 10 Productive Apps',
            subTxt: 'Jenny Choi',
            rightTxt: '3 hr ago',
          ),
          SettingTile(
            title: 'hua',
            subTxt: 'Jenny Choi',
            rightTxt: '3 hr ago',
          ),
          SettingTile(
            title: 'Top 10 Productive Apps',
            subTxt: 'Jenny Choi',
            rightTxt: '3 hr ago',
          ),
          SettingTile(
            title: 'Top 10 Productive Apps',
            subTxt: 'Jenny Choi',
            rightTxt: '3 hr ago',
          ),
          SettingTile(
            title: 'Top 10 Productive Apps',
            subTxt: 'Jenny Choi',
            rightTxt: '3 hr ago',
          ),
          SettingTile(
            title: 'Top 10 Productive Apps',
            subTxt: 'Jenny Choi',
            rightTxt: '3 hr ago',
          ),
          SettingTile(
            title: 'Top 10 Productive Apps',
            subTxt: 'Jenny Choi',
            rightTxt: '3 hr ago',
          ),
          SettingTile(
            title: 'Top 10 Productive Apps',
            subTxt: 'Jenny Choi',
            rightTxt: '3 hr ago',
          ),
        ],
      ),
    );
  }
}