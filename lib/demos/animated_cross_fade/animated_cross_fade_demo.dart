import 'package:flutter/material.dart';

import 'login.dart';
import 'signup.dart';

class AnimatedCrossFadeDemo extends StatefulWidget {
  final String title = 'Animated Cross Fade';

  @override
  _AnimatedCrossFadeDemoState createState() => _AnimatedCrossFadeDemoState();
}

class _AnimatedCrossFadeDemoState extends State<AnimatedCrossFadeDemo> {
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
              duration: Duration(milliseconds: 500),
            ),
            ElevatedButton(
              child: Text('Done'),
              onPressed: () {},
            ),
            TextButton(
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
