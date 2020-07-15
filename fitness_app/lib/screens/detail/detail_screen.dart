import 'package:fitness_app/config/constants.dart';
import 'package:fitness_app/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/widgets/search_bar.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .45,
            decoration: BoxDecoration(
              color: kBlueLightColor,
              image: DecorationImage(
                image: AssetImage("assets/images/meditation_bg.png"),
                fit: BoxFit.fitWidth
              )
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Text(
                      "Meditation",
                      style: Theme.of(context)
                      .textTheme
                      .display1
                      .copyWith(fontWeight: FontWeight.w900),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      "3-10 MIN Course",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10,),
                    SizedBox(
                      width: size.width * .6,
                      child: Text(
                        "Live happlier with doing meditation course"
                      ),
                    ),
                    SizedBox(
                      width: size.width * .5,
                      child: SearchBar()
                    ),
                    Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      children: <Widget>[
                        SessionCard(
                          seassionNum: 1,
                          isDone: true,
                          press: () {},
                        ),
                        SessionCard(
                          seassionNum: 2,
                          isDone: true,
                          press: () {},
                        ),
                        SessionCard(
                          seassionNum: 3,
                          isDone: true,
                          press: () {},
                        ),
                        SessionCard(
                          seassionNum: 4,
                          isDone: true,
                          press: () {},
                        ),
                        SessionCard(
                          seassionNum: 5,
                          isDone: true,
                          press: () {},
                        ),
                        SessionCard(
                          seassionNum: 6,
                          isDone: false,
                          press: () {},
                        ),
                        SessionCard(
                          seassionNum: 7,
                          isDone: false,
                          press: () {},
                        ),
                        SessionCard(
                          seassionNum: 8,
                          isDone: false,
                          press: () {},
                        ),
                      ]
                    ),
                    SizedBox(height: 20,),
                    Text(
                      'Meditation',
                      style: Theme.of(context)
                        .textTheme
                        .title
                        .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      padding: EdgeInsets.all(10),
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(13),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 17),
                            blurRadius: 23,
                            spreadRadius: -13,
                            color: kShadowColor
                          )
                        ]
                      ),
                      child: Row(
                        children: <Widget>[
                          SvgPicture.asset(
                            "assets/icons/Meditation_women_small.svg"
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Basic 6",
                                  style: Theme.of(context).textTheme.subtitle2,
                                ),
                                Text("Start your ")
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: SvgPicture.asset("assets/icons/Lock.svg"),
                          )
                        ]
                      ),
                    )
                  ],
                ),
              ),
            ) ,
          )
        ],
      ),
    );
  }
}

class SessionCard extends StatelessWidget {
  final int seassionNum;
  final bool isDone;
  final Function press;
  const SessionCard({
    Key key,
    this.seassionNum,
    this.isDone = false,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(13),
          child: Container(
            width: constraints.maxWidth / 2 - 10,
            // padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(13),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 17),
                  blurRadius: 23,
                  spreadRadius: -13,
                  color: kShadowColor
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child:InkWell(
                onTap: press,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 42,
                        width: 43,
                        decoration: BoxDecoration(
                          color: isDone ? kBlueColor : Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: kBlueColor),
                        ),
                        child: Icon(
                          Icons.play_arrow,
                          color: isDone ? Colors.white : kBlueColor,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Session $seassionNum",
                        style: Theme.of(context).textTheme.subtitle,
                      )
                    ],
                  ),
                ),
              )
            ),
          ),
        );
      }
    );
  }
}