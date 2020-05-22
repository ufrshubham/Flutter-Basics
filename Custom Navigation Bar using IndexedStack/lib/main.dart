import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Indexed Stack',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Indexed Stack'),
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
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
              child: Column(
          children: <Widget>[_getStackedContainers(), _getNavigationButton()],
        ), padding: EdgeInsets.all(5.0),
      ),
    );
  }

  Widget _getStackedContainers() {
    return Expanded(
      child: IndexedStack(
        index: index,
        children: <Widget>[
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.green,
          ),
        ],
      ),
    );
  }

  Widget _getNavigationButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        FlatButton(
          child: Text('Red', style: TextStyle(fontSize: 15.0),),
          onPressed: () {
            setState(() {
              index = 0;
            });
          },
        ),
        FlatButton(
          child: Text('Blue', style: TextStyle(fontSize: 15.0),),
          onPressed: () {
            setState(() {
              index = 1;
            });
          },
        ),
        FlatButton(
          child: Text('Green', style: TextStyle(fontSize: 15.0),),
          onPressed: () {
            setState(() {
              index = 2;
            });
          },
        ),
      ],
    );
  }
}
