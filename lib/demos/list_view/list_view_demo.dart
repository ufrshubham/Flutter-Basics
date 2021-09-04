import 'package:flutter/material.dart';

class ListViewDemo extends StatelessWidget {
  final String title = 'ListView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        reverse: true,
        itemExtent: 100.0,
        itemCount: 100,
        itemBuilder: (context, index) {
          return index % 5 == 0
              ? Text(
                  'Header',
                  style: TextStyle(fontSize: 20.0),
                  textAlign: TextAlign.center,
                )
              : ListTile(
                  title: Text('Item $index'),
                );
        },
      ),
    );
  }
}
