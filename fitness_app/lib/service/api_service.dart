import 'dart:convert';

import 'package:fitness_app/config/private/private_api_key.dart';
import 'package:fitness_app/model/artical_model.dart';
import 'package:http/http.dart' as http;


class APIService {
  final String _baseUrl = 'api.nytimes.com';
  static const String API_KEY = nytimes_api;

  Future<List<ArticleModel>> fetchArticlesBySection(String section) async {
    Map<String, String> parameters = {
      'api-key': API_KEY,
    };
    Uri uri = Uri.https(
      _baseUrl,
      '/svc/topstories/v2/$section.json',
      parameters,
    );
    try {
      // 1. get response data
      var response = await http.get(uri);
      final result = json.decode(response.body);
      // 2. convert to ArticleModel
      //ArticleModel articles = ArticleModel.fromJson(data);
      // 3. build list
      final articleArray = result["results"];
      List<ArticleModel> articles = [];
      for(var json in articleArray) {
        articles.add(ArticleModel.fromJson(json));
      }
      return articles;
    } catch (err) {
      throw err.toString();
    }
  }
}