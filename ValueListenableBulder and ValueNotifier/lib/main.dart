import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Value Listenable Builder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Value Listenable Builder'),
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
  var rot = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ValueListenableBuilder(
          valueListenable: rot,
          child: _getContainer(),
          builder: (context, n, c) {
            return Transform.rotate(
              angle: (n * (pi / 180)),
              child: c,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          rot.value += 30;
          if (rot.value >= 180) {
            rot.value = 0;
          }
        },
        child: Icon(Icons.rotate_right),
      ),
    );
  }

  Container _getContainer() {
    return Container(
      color: Colors.blue,
      height: 300.0,
      width: 300.0,
    );
  }
}
