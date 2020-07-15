import 'package:fitness_app/config/constants.dart';
import 'package:fitness_app/screens/funiture/components/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FunitureScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      title: Text('DashBord'),
      centerTitle: false,
      actions: <Widget>[
        IconButton(icon:SvgPicture.asset("assets/icons/funi_notification.svg"),
          onPressed: null,
        )
      ],
    );
  }
}