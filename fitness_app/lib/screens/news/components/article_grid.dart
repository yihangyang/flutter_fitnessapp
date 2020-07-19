// import 'package:flutter/material.dart';

// class ArticleGrid extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     List<GridTile> tiles = [];
//     int index = 0;
//     _articles.forEach((article) {
//       index++;
//       tiles.add(_buildArticlesTile(article, mediaQuery, index));
//     });
//     return Padding(
//       padding: EdgeInsets.all(0),
//       child: GridView.count(
//         crossAxisCount: 2,
//         mainAxisSpacing: 30,
//         crossAxisSpacing: 15,
//         shrinkWrap: true,
//         physics: NeverScrollableScrollPhysics(),
//         children: tiles,
//       ),
//     );
//   }
// }