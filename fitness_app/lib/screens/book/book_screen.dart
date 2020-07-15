import 'package:fitness_app/screens/book/components/rounded_button.dart';
import 'package:fitness_app/screens/reading/shell/shell_screen.dart';
import 'package:flutter/material.dart';

class BookScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Bitmap.png"),
            fit: BoxFit.fill
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.display3,
                children: [
                  TextSpan(
                    text: "Hft",
                  ),
                  TextSpan(
                    text: "Leipzig.",
                    style: TextStyle(fontWeight: FontWeight.bold)
                  )
                ]
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .5,
                child: RoundedButton(
                text: "start reading",
                fontSize: 20,
                press: () {
                  Navigator.push(
                    context, MaterialPageRoute(
                      builder: (context) {
                        return ShellScreen();
                      }
                    )
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

