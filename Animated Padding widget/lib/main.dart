import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Padding',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Animated Padding'),
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
  double inset = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: AnimatedPadding(
        curve: Curves.slowMiddle,
        padding: EdgeInsets.all(inset),
        duration: Duration(milliseconds: 500),
        child: Image(
          image: AssetImage('assets/dog2.jpg'),
        ),
      )),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            child: Icon(Icons.zoom_in),
            onPressed: () {
              setState(() {
                inset += 100;
              });
            },
          ),
          FloatingActionButton(
            child: Icon(Icons.zoom_out),
            onPressed: () {
              setState(() {
                if (inset > 100) {
                  inset -= 100;
                }
              });
            },
          ),
        ],
      ),
    );
  }
}
