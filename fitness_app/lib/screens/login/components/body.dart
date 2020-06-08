import 'package:fitness_app/components/have_account_check.dart';
import 'package:fitness_app/components/rounded_button.dart';
import 'package:fitness_app/components/rounded_input_field.dart';
import 'package:fitness_app/components/rounded_password_field.dart';
import 'package:fitness_app/screens/login/components/background.dart';
import 'package:fitness_app/screens/signup/singup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Text(
              "LOGON",
              style: TextStyle(fontWeight: FontWeight.bold)
            ),
            SizedBox(
              height: size.height * .05,
            ),
            SvgPicture.asset(
              "assets/icons/login.svg",
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
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "LOGON",
              press: () {},
            ),
            SizedBox(
              height: size.height * .03,
            ),
            HaveAccountCheck(
              press: () {
                Navigator.push(
                  context, MaterialPageRoute(
                    builder: (context) {
                      return SignupScreen();
                    }
                  )
                );
              },
            )
          ]
        ),
      ),
    );
  }
}

