import 'package:fitness_app/screens/setting/setting_screen.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final name;
  final image;
  final subTitle;
  final upvotes;
  ItemCard(this.name, this.image, this.subTitle, this.upvotes);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        height: 160.0,
        width: 140.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: buttonColor.withOpacity(0.8),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 16.0,
            ),
            Container(
              width: 60.0,
              height: 60.0,
              child: Image.network(
                image,
              ),
            ),
            SizedBox(
              height: 4.0,
            ),
            Text(
              name,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 2.0,
            ),
            Text(
              subTitle,
              style: TextStyle(
                  color: Colors.white.withOpacity(0.6), fontSize: 12.0),
            ),
            SizedBox(
              height: 4.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: buttonColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.arrow_upward,
                        color: Colors.green,
                        size: 14.0,
                      ),
                      Text(
                        upvotes,
                        style: TextStyle(color: Colors.white, fontSize: 12.0),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}