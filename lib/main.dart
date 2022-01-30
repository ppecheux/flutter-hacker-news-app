import 'package:flutter/material.dart';
import 'package:flutter_hacker_news_app/page/hacker_news_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hacker News',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HackerNewsView(),
    );
  }
}
