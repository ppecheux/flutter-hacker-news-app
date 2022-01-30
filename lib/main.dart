import 'package:flutter/material.dart';
import 'package:flutter_hacker_news_app/page/hacker_news_page.dart';
import 'package:flutter_hacker_news_app/page/user_page.dart';
import 'package:go_router/go_router.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  /*
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
*/

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate,
      );

  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => HackerNewsView(),
      ),
      GoRoute(
        path: '/user/:id',
        builder: (context, state) => UserView(state.params['id']!),
      ),
    ],
  );
}
