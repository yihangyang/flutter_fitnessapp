import 'dart:convert';
import 'dart:io';

import 'package:fitness_app/config/private/private_api_key.dart';
import 'package:fitness_app/model/artical_model.dart';
import 'package:fitness_app/model/channel_model.dart';
import 'package:fitness_app/model/video_model.dart';
import 'package:http/http.dart' as http;


class NytAPIService {
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

class YtbAPIService {

  YtbAPIService._instantiate();

  static final YtbAPIService instance = YtbAPIService._instantiate();

  final String _baseUrl = 'www.googleapis.com';
  String _nextPageToken = "";

  Future<Channel> fetchChannel({String channelId}) async {
    Map<String, String> parameters = {
      'part': 'snippet, contentDetails, statistics',
      'id': channelId,
      'key': youtube_api,
    };
    Uri uri = Uri.https(
      _baseUrl,
      '/youtube/v3/channels',
      parameters,
    );
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    // Get Channel
    var response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body)['items'][0];
      Channel channel = Channel.fromMap(data);

      // Fetch first batch of videos from uploads playlist
      channel.videos = await fetchVideosFromPlaylist(
        playlistId: channel.uploadPlaylistId,
      );
      return channel;
    } else {
      throw json.decode(response.body)['error']['message'];
    }
  }

  Future<List<Video>> fetchVideosFromPlaylist({String playlistId}) async {
    Map<String, String> parameters = {
      'part': 'snippet',
      'playlistId': playlistId,
      'maxResults': '8',
      'pageToken': _nextPageToken,
      'key': youtube_api,
    };
    Uri uri = Uri.https(
      _baseUrl,
      '/youtube/v3/playlistItems',
      parameters,
    );
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    // Get Playlist Videos
    var response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      _nextPageToken = data['nextPageToken'] ?? '';
      List<dynamic> videosJson = data['items'];

      // Fetch first eight videos from uploads playlist
      List<Video> videos = [];
      videosJson.forEach(
        (json) => videos.add(
          Video.fromMap(json['snippet']),
        ),
      );
      return videos;
    } else {
      throw json.decode(response.body)['error']['message'];
    }
  }
}