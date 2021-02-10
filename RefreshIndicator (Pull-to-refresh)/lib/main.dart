import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pull to refresh',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Pull to refresh'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

const randomUsersUrl = 'https://randomuser.me/api/?results=20';

class _MyHomePageState extends State<MyHomePage> {
  List<User> _users;

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
                itemCount: _users.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(_users.elementAt(index).name),
                    subtitle: Text(_users.elementAt(index).email),
                    trailing: Image.network(
                      _users.elementAt(index).imageUrl,
                    ),
                  );
                },
              ),
            ),
    );
  }

  Future<void> _getUsers() async {
    final response = await http.get(randomUsersUrl);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      final temp = List<User>();
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

  User({this.name, this.email, this.imageUrl});
}
