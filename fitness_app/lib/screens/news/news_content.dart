import 'package:fitness_app/model/artical_model.dart';
import 'package:fitness_app/screens/news/components/article_grid.dart';
import 'package:fitness_app/service/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsContent extends StatefulWidget {
  @override
  _NewsContentState createState() => _NewsContentState();
}

class _NewsContentState extends State<NewsContent> {
  List<ArticleModel> _articles = [];

  @override
  void initState() {
    _fetchArticles('technology');
    super.initState();
  }

  _fetchArticles(String serchKey) async {
    List<ArticleModel> articles =
        await NytAPIService().fetchArticlesBySection(serchKey);
    setState(() {
      _articles = articles;
    });
  }

  _buildArticlesGrid(MediaQueryData mediaQuery) {
    List<GridTile> tiles = [];
    int index = 0;
    _articles.forEach((article) {
      index++;
      tiles.add(_buildArticlesTile(article, mediaQuery, index));
    });
    return Padding(
      padding: EdgeInsets.all(5),
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 30,
        crossAxisSpacing: 15,
        childAspectRatio: .9,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: tiles,
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _buildArticlesTile(
      ArticleModel article, MediaQueryData mediaQuery, int index) {
    return GridTile(
      child: GestureDetector(
        onTap: () => _launchURL(article.url),
        child: Column(
          children: [
            // photo
            Container(
              height: 120,
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  image: DecorationImage(
                      image: NetworkImage(article.multimedia != null
                          ? article.multimedia[0].url
                          : "https://static01.nyt.com/images/2020/07/19/business/00airbnb1/merlin_173400378_c8e2a75e-fc10-4a7b-83e3-0a448fe486e1-superJumbo.jpg"),
                      fit: BoxFit.cover)),
            ),
            // title
            Container(
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.center,
              height: 70,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 1),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: Text(
                article.title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 40,
          ),
          Center(
            child: Text(
              "Centre News\nTop Tech Articles",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          _articles.length > 0
              ? _buildArticlesGrid(mediaQuery)
              : Center(
                  child: CircularProgressIndicator(),
                )
        ],
      ),
    );
  }
}
