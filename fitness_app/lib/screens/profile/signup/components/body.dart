import 'package:fitness_app/widgets/have_account_check.dart';
import 'package:fitness_app/widgets/rounded_button.dart';
import 'package:fitness_app/widgets/rounded_input_field.dart';
import 'package:fitness_app/widgets/rounded_password_field.dart';
import 'package:fitness_app/screens/profile/login/login_screen.dart';
import 'package:fitness_app/screens/profile/signup/components/background.dart';
import 'package:fitness_app/screens/profile/signup/components/or_divider.dart';
import 'package:fitness_app/screens/profile/signup/components/social_icon.dart';
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
              "SIGN UP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * .05,
            ),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * .35,
            ),
            SizedBox(
              height: size.height * .03,
            ),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {}
            ),
            RoundedButton(
              text: "SIGNUP",
              press: () {},
            ),
            SizedBox(
              height: size.height * .03,
            ),
            HaveAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context, MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    }
                  )
                );
              },
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocialIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {},
                ),
                SocialIcon(
                  iconSrc: "assets/icons/twitter.svg",
                  press: () {},
                ),
                SocialIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

