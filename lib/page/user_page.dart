import 'package:flutter/material.dart';
import 'package:flutter_hacker_news_app/bloc/user/user_bloc.dart';
import 'package:flutter_hacker_news_app/datamodel/HackerNewsUser.dart';
import 'package:provider/provider.dart';

class UserView extends StatelessWidget {
  UserView(this.userId);
  final String userId;
  @override
  Widget build(BuildContext context) {
    return Provider<UserBloc>(
      create: (context) => UserBloc(),
      dispose: (context, bloc) => bloc.dispose(),
      child: UserPage(userId),
    );
  }
}

class UserPage extends StatefulWidget {
  UserPage(this.userId);
  final String userId;
  @override
  _UserPageState createState() => _UserPageState(userId);
}

class _UserPageState extends State<UserPage> {
  late UserBloc _bloc;
  String _userId;
  _UserPageState(this._userId);

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc = Provider.of<UserBloc>(context);
    _bloc.loadUser(id: _userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User')),
      body: StreamBuilder(
        stream: _bloc.user,
        builder:
            (BuildContext context, AsyncSnapshot<HackerNewsUser> snapshot) {
          if (snapshot.hasData) return _buildUserProfile(user: snapshot.data!);
          if (snapshot.hasError)
            return Center(child: Text('${snapshot.error}'));
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _buildUserProfile({required HackerNewsUser user}) {
    return Card(
      child: ListTile(
        title: Text(user.id),
        subtitle: Text(user.about ?? ''),
        trailing: Text(user.karma.toString()),
      ),
    );
  }
}
