import 'package:fitness_app/screens/setting/setting_screen.dart';
import 'package:flutter/material.dart';

class SettingTile extends StatelessWidget {
  final String title;
  final String subTxt;
  final String rightTxt;
  const SettingTile({
    Key key,
    this.title,
    this.subTxt,
    this.rightTxt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(profileImage2),
      ),
      title: Text(this.title,
          style: TextStyle(color: Colors.white)),
      subtitle: Text(
        this.subTxt,
        style: TextStyle(
            color: Colors.white.withOpacity(0.6)),
      ),
      trailing: Text(
        this.rightTxt,
        style: TextStyle(
            color: Colors.white.withOpacity(0.6)),
      ),
    );
  }
}