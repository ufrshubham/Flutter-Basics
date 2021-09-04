import 'dart:math';

import 'package:flutter/material.dart';

class ValueListenableBuilderDemo extends StatelessWidget {
  final String title = 'Value Listenable Builder';
  final rot = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: ValueListenableBuilder<int>(
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
