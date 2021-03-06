import 'package:fitness_app/screens/reading/welcome/welcome_screen.dart';
import 'package:fitness_app/screens/home/components/bottom_nav_item.dart';
import 'package:fitness_app/screens/setting/setting_screen.dart';
import 'package:flutter/material.dart';



class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      height: 70,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          BottomNavItem(
            title: "Today",
            svgScr: "assets/icons/calendar.svg",
          ),
          BottomNavItem(
            title: "All Excerises",
            svgScr: "assets/icons/gym.svg",
            isActive: true,
            press: () {},
          ),
          BottomNavItem(
            title: "Settings",
            svgScr: "assets/icons/Settings.svg",
            press: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) {
                    return SettingScreen();
                  }
                ),
              );
            }
          ),
        ],
      ),
    );
  }
}