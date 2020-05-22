import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            child: Text(
              'Login',
              style: TextStyle(fontSize: 30),
            ),
            padding: EdgeInsets.only(bottom: 100.0),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'User name'),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Password'),
          ),
        ],
      ),
    );
  }
}
