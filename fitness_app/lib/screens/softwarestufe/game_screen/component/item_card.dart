import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final name;
  final icon;
  final color;
  final type;
  final progress;
  final colors;
  ItemCard(
      this.name, this.icon, this.color, this.type, this.progress, this.colors);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40.0,
        color: color,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        icon,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 18.0,
                      ),
                      Text(
                        type,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 14.0,
                  ),
                  Text(
                    name,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        letterSpacing: 1.2),
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
              height: 4.0,
              width: progress,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: colors,
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight)),
            )
          ],
        ));
  }
}