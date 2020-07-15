import 'package:fitness_app/screens/reading/welcome/components/background.dart';
import 'package:fitness_app/widgets/rounded_button.dart';
import 'package:fitness_app/config/constants.dart';
import 'package:fitness_app/screens/login/login_screen.dart';
import 'package:fitness_app/screens/signup/singup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Welcome You",
              style: TextStyle(fontWeight: FontWeight.bold)
            ),
            SizedBox(height: size.height * .03,),
            SvgPicture.asset(
              "assets/icons/chat.svg",
              height: size.height * .5,
            ),
            SizedBox(height: size.height * .05,),
            RoundedButton(
              text: "LOGON",
              press: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    }
                  ),
                );
              },
            ),
            RoundedButton(
              text: "SIGN UP",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) {
                      return SignupScreen();
                    }
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

