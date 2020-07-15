import 'package:fitness_app/config/constants.dart';
import 'package:fitness_app/screens/reading/shell/components/book_rating.dart';
import 'package:fitness_app/screens/reading/shell/components/two_side_rounded_button.dart';
import 'package:flutter/material.dart';

class ShellScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/main_page_bg.png"),
            alignment: Alignment.topCenter,
            fit: BoxFit.fitWidth
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: size.height * .1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: RichText(
                text: TextSpan(
                  style:Theme.of(context).textTheme.display1,
                  children: [
                    TextSpan(
                      text: "What are you \nReading "
                    ),
                    TextSpan(
                      text: "today?",
                      style: TextStyle(fontWeight: FontWeight.bold)
                    )
                  ]
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              height: 245,
              width: 202,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 221,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(29),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 33,
                            color: kShadowColorBook,
                          )
                        ]
                      ),
                    ),
                  ),
                  Image.asset(
                    "assets/images/book-1.png",
                    width: 150,
                  ),
                  Positioned(
                    top: 35,
                    right: 10,
                    child: Column(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.favorite_border
                          ),
                          onPressed: () {},
                        ),
                        BookRating(score: 4.9),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 160,
                    child: Container(
                      height: 85,
                      width: 202,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 24),
                            child: RichText(
                              maxLines: 2,
                              text: TextSpan(
                                style: TextStyle(color: kBlackColor),
                                children: [
                                  TextSpan(
                                    text: "Crushing & Influence\n",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Gary Venchuk",
                                    style: TextStyle(
                                      color: kLightBlackColor
                                    ),
                                  ),
                                ]
                              ),
                            ),
                          ),
                          Spacer(),
                          Row(
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  width: 101,
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  alignment: Alignment.center,
                                  child: Text("Details"),
                                ),
                              ),
                              Expanded(
                                child: TwoSideRoundedButton(
                                  text: "Read",
                                  press: () {},
                                )
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

