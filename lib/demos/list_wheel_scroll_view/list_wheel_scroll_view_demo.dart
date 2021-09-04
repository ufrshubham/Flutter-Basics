import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  final String title = 'List Wheel Scroll';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListWheelScrollView.useDelegate(
        itemExtent: 200,
        diameterRatio: 3,
        renderChildrenOutsideViewport: true,
        clipBehavior: Clip.hardEdge,
        physics: BouncingScrollPhysics(),
        childDelegate: ListWheelChildBuilderDelegate(
          childCount: 100,
          builder: (context, index) => Container(
            color: Colors.green,
            child: Center(
              child: Text('Item $index'),
            ),
          ),
        ),
      ),
    );
  }
}
