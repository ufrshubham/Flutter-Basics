import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RefreshIndicatorDemo extends StatefulWidget {
  final String title = 'Refresh Indicator';

  @override
  _RefreshIndicatorDemoState createState() => _RefreshIndicatorDemoState();
}

class _RefreshIndicatorDemoState extends State<RefreshIndicatorDemo> {
  // static const randomUsersUrl = 'https://randomuser.me/api/?results=20';

  static const authority = 'www.randomuser.me';
  static const unencodedPath = '/api';
  static const numberOfUsers = 20;
  List<User>? _users;

  @override
  void initState() {
    super.initState();
    _getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _users == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
              onRefresh: _getUsers,
              child: ListView.builder(
                physics: AlwaysScrollableScrollPhysics(),
                itemCount: _users!.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(
                      _users!.elementAt(index).name,
                    ),
                    subtitle: Text(
                      _users!.elementAt(index).email,
                    ),
                    trailing: Image.network(
                      _users!.elementAt(index).imageUrl,
                    ),
                  );
                },
              ),
            ),
    );
  }

  Future<void> _getUsers() async {
    final response = await http.get(Uri.https(authority, unencodedPath, {
      'results': numberOfUsers,
    }));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      final temp = List<User>.empty(growable: true);
      for (final user in data['results']) {
        temp.add(
          User(
            name:
                "${user['name']['title']} ${user['name']['first']} ${user['name']['last']}",
            email: user['email'],
            imageUrl: user['picture']['thumbnail'],
          ),
        );
      }

      setState(() {
        _users = temp;
      });
    }
  }
}

class User {
  final String name;
  final String email;
  final String imageUrl;

  User({
    required this.name,
    required this.email,
    required this.imageUrl,
  });
}
