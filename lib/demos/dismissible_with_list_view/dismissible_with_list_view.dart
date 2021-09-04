import 'package:flutter/material.dart';

class DismissibleListViewDemo extends StatefulWidget {
  final String title = 'Dismissible List View';

  @override
  _DismissibleListViewDemoState createState() =>
      _DismissibleListViewDemoState();
}

class _DismissibleListViewDemoState extends State<DismissibleListViewDemo> {
  final _myList = List<String>.empty(growable: true);
  int n = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
          itemCount: _myList.length,
          itemBuilder: (context, index) {
            return Dismissible(
              background: Container(
                color: Colors.blue,
              ),
              secondaryBackground: Container(
                color: Colors.red,
              ),
              onResize: () {
                debugPrint('Being dismissed!!!');
              },
              onDismissed: (direction) {
                setState(() {
                  _myList.removeAt(index);
                });
              },
              key: ValueKey(_myList.elementAt(index)),
              child: ListTile(
                title: Text(_myList.elementAt(index)),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            _myList.add('Item $n');
            ++n;
          });
        },
      ),
    );
  }
}
