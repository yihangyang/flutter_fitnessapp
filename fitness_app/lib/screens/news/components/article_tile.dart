import 'package:fitness_app/model/artical_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleTile extends StatelessWidget {
  final ArticleModel article;
  final MediaQueryData mediaQuery;
  final int index;

  const ArticleTile({Key key, this.article, this.mediaQuery, this.index})
      : super(key: key);

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
    );
  }
}
