import 'dart:convert';

import 'package:flutter_hacker_news_app/datamodel/HackerNewsUser.dart';
import 'package:flutter_hacker_news_app/datamodel/story.dart';
import 'package:http/http.dart' as http;

class HackerNewsRepository {
  final _httpClient = http.Client();
  static Uri apiEndpoint = Uri.https('hacker-news.firebaseio.com', '/');
  Future<Story> loadStory(int id) async {
    final response =
        await _httpClient.get(apiEndpoint.resolve('/v0/item/$id.json'));
    if (response.statusCode != 200)
      throw http.ClientException('Failed to load story with id $id');
    return Story.fromJson(json.decode(response.body));
  }

  Future<List<int>> loadTopStoryIds() async {
    final response =
        await _httpClient.get(apiEndpoint.resolve('/v0/topstories.json'));
    if (response.statusCode != 200)
      throw http.ClientException('Failed to load top story ids');
    return List<int>.from(json.decode(response.body));
  }

  Future<HackerNewsUser> loadUser(String id) async {
    final response =
        await _httpClient.get(apiEndpoint.resolve('/v0/user/$id.json'));
    if (response.statusCode != 200)
      throw http.ClientException('Failed to load user with id $id');
    return HackerNewsUser.fromJson(json.decode(response.body));
  }

  void dispose() {
    _httpClient.close();
  }
}
