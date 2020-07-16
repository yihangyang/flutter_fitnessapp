import 'package:fitness_app/config/constants.dart';
import 'package:fitness_app/screens/softwarestufe/stufe_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StufeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: buildAppBar(),
      body: StufeContent(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      title: Text('8-Level Softwareentwicklungsprozess'),
      centerTitle: false,
      actions: <Widget>[
        IconButton(icon:SvgPicture.asset("assets/icons/funi_notification.svg"),
          onPressed: null,
        )
      ],
    );
  }
}