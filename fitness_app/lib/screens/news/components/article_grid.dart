import 'package:fitness_app/model/artical_model.dart';
import 'package:fitness_app/screens/news/components/article_tile.dart';
import 'package:flutter/material.dart';

class ArticleGrid extends StatelessWidget {
  final List<ArticleModel> articles;
  final MediaQueryData mediaQuery;

  const ArticleGrid({Key key, this.articles, this.mediaQuery})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<GridTile> tiles = [];
    int index = 0;
    articles.forEach((article) {
      index++;
      tiles.add(GridTile(
          child: ArticleTile(
              article: article, mediaQuery: mediaQuery, index: index)));
      print(tiles.toList());
    });
    return Padding(
      padding: EdgeInsets.all(0),
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 30,
        crossAxisSpacing: 15,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: tiles,
      ),
    );
  }
}
