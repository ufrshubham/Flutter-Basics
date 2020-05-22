import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            child: Text(
              'Sign Up',
              style: TextStyle(fontSize: 30),
            ), padding: EdgeInsets.only(bottom: 100.0),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'User name'),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Email'),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Password'),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Confirm Password'),
          ),
        ],
      ),
    );
  }
}
