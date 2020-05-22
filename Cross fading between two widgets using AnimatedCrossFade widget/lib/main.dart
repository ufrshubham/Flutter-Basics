import 'package:flutter/material.dart';

import 'login.dart';
import 'signup.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Cross Fade',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Animated Cross Fade'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool flag = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            AnimatedCrossFade(
                firstChild: Login(),
                secondChild: SignUp(),
                crossFadeState:
                    flag ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                duration: Duration(milliseconds: 500)),
            RaisedButton(
              child: Text('Done'),
              onPressed: () {},
            ),
            FlatButton(
              child: Text(flag ? 'Go to Sign Up' : 'Go to Login'),
              onPressed: () {
                setState(() {
                  flag = !flag;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
