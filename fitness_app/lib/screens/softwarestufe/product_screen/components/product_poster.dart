import 'package:carousel_slider/carousel_slider.dart';
import 'package:fitness_app/config/constants.dart';
import 'package:flutter/material.dart';


class ProductPoster extends StatelessWidget {
  const ProductPoster({
    Key key,
    @required this.size,
    this.image,
  }) : super(key: key);

  final Size size;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
      // the height of this container is 80% of our width
      height: size.width * 0.8,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Container(
            height: size.height * 0.8,
            width: size.width * 0.8,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              // enlargeCenterPage: true,
              height:size.height * 0.3
            ),
            items: [1,2,3].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      // color: Colors.amber
                    ),
                    child: Column(
                      children: [
                        Image.network(
                          image,
                          height: size.height * 0.20,
                          width: size.width * 0.40,
                          fit: BoxFit.cover,
                        ),
                        Text('Pics $i', style: TextStyle(fontSize: 12.0),),
                      ],
                    ),
                  );
                },
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}