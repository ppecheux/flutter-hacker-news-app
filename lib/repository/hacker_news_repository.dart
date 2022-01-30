import 'dart:convert';

import 'package:flutter_hacker_news_app/datamodel/HackerNewsUser.dart';
import 'package:flutter_hacker_news_app/datamodel/story.dart';
import 'package:http/http.dart' as http;

class HackerNewsRepository {
  final _httpClient = http.Client();
  static const String API_ENDPOINT = 'https://hacker-news.firebaseio.com/v0/';

  Future<Story> loadStory(int id) async {
    final response = await _httpClient.get(API_ENDPOINT + 'item/$id.json');
    if (response.statusCode != 200)
      throw http.ClientException('Failed to load story with id $id');

    print('loadStory: ${json.decode(response.body)}');
    return Story.fromJson(json.decode(response.body));
  }

  Future<List<int>> loadTopStoryIds() async {
    final response = await _httpClient.get(API_ENDPOINT + 'topstories.json');
    if (response.statusCode != 200)
      throw http.ClientException('Failed to load top story ids');

    print("loadTopStoryIds: ${json.decode(response.body)}");
    return List<int>.from(json.decode(response.body));
  }

  Future<HackerNewsUser> loadUser(String id) async {
    final response = await _httpClient.get(API_ENDPOINT + 'user/$id.json');
    if (response.statusCode != 200)
      throw http.ClientException('Failed to load user with id $id');
    return HackerNewsUser.fromJson(json.decode(response.body));
  }

  void dispose() {
    _httpClient.close();
  }
}
