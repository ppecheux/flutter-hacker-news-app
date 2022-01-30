import 'dart:async';

import 'package:flutter_hacker_news_app/datamodel/HackerNewsUser.dart';
import 'package:flutter_hacker_news_app/repository/hacker_news_repository.dart';

import '../base_bloc.dart';

class UserBloc extends Bloc {
  late HackerNewsUser _user;
  final _repository = HackerNewsRepository();
  var _isLoadingUser = false;
  StreamController<HackerNewsUser> _userStreamController = StreamController();
  Stream<HackerNewsUser> get user => _userStreamController.stream;

  void loadUser({required String id}) async {
    if (_isLoadingUser) return;
    _isLoadingUser = true;
    try {
      _user = await _repository.loadUser(id);
    } catch (e) {
      print('Failed to load user with id $_user');
    }
    _userStreamController.sink.add(_user);
    _isLoadingUser = false;
  }

  @override
  void dispose() {
    _userStreamController.close();
    _repository.dispose();
  }
}
