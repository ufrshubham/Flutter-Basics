import 'package:flutter/material.dart';

class IndexedStackDemo extends StatefulWidget {
  final String title = 'Indexed Stack';

  @override
  _IndexedStackDemoState createState() => _IndexedStackDemoState();
}

class _IndexedStackDemoState extends State<IndexedStackDemo> {
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
        ),
        padding: EdgeInsets.all(5.0),
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
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          TextButton(
            child: Text(
              'Red',
              style: TextStyle(fontSize: 15.0),
            ),
            onPressed: () {
              setState(() {
                index = 0;
              });
            },
          ),
          TextButton(
            child: Text(
              'Blue',
              style: TextStyle(fontSize: 15.0),
            ),
            onPressed: () {
              setState(() {
                index = 1;
              });
            },
          ),
          TextButton(
            child: Text(
              'Green',
              style: TextStyle(fontSize: 15.0),
            ),
            onPressed: () {
              setState(() {
                index = 2;
              });
            },
          ),
        ],
      ),
    );
  }
}
