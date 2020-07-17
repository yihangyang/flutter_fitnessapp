import 'package:fitness_app/screens/home/components/categorie_card.dart';
import 'package:fitness_app/screens/meditation/meditation_screen.dart';
import 'package:fitness_app/screens/reading/reading_screen.dart';
import 'package:fitness_app/screens/softwarestufe/stufe_screen/stufe_screen.dart';
import 'package:fitness_app/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({
    Key key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Container(
          height: size.height * .45, // height of container is 45% of total
          decoration: BoxDecoration(
            color: Color(0xFFF5CE88),
            image: DecorationImage(
              alignment: Alignment.centerLeft,
              image: AssetImage("assets/images/undraw_pilates_gpdb.png"),
            ),
          ),
          //color: Colors.black,
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        color: Color(0xFFF2BEA1),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset("assets/icons/menu.svg"),
                      
                    ),
                  ),
                  Text(
                    "Good Morning \nJenny",
                    style: Theme.of(context)
                      .textTheme
                      .display1
                      .copyWith(fontWeight: FontWeight.w900),
                  ),
                  SearchBar(),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: .85,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: <Widget>[
                        CategorieCard(
                          title: "Funiture",
                          svgSrc: "assets/icons/fit_hamburger.svg",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return StufeScreen();
                              })
                            );
                          }
                        ),
                        CategorieCard(
                          title: "Reading",
                          svgSrc: "assets/icons/fit_excrecises.svg",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return ReadingScreen();
                              })
                            );
                          },
                        ),
                        CategorieCard(
                          title: "Meditation",
                          svgSrc: "assets/icons/fit_meditation.svg",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return MeditationScreen();
                              })
                            );
                          },
                        ),
                        CategorieCard(
                          title: "Yoga",
                          svgSrc: "assets/icons/fit_yoga.svg",
                          press: () {},
                        ),
                        CategorieCard(
                          title: "Diet Recommendation",
                          svgSrc: "assets/icons/fit_hamburger.svg",
                          press: () {},
                        ),
                        CategorieCard(
                          title: "Kegel Exercises",
                          svgSrc: "assets/icons/fit_excrecises.svg",
                          press: () {},
                        ),
                        CategorieCard(
                          title: "Meditation",
                          svgSrc: "assets/icons/fit_meditation.svg",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return MeditationScreen();
                              })
                            );
                          },
                        ),
                        CategorieCard(
                          title: "Yoga",
                          svgSrc: "assets/icons/fit_yoga.svg",
                          press: () {},
                        ),
                      ],
                    )
                  )
                ],
              ),
            ),
          )
        )
      ],
    );
  }
}