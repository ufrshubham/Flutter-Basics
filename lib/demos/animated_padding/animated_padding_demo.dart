import 'package:flutter/material.dart';

class AnimatedPaddingDemo extends StatefulWidget {
  final String title = 'Animated Padding';

  @override
  _AnimatedPaddingDemoState createState() => _AnimatedPaddingDemoState();
}

class _AnimatedPaddingDemoState extends State<AnimatedPaddingDemo> {
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
          child: Image.network(
              'https://images.unsplash.com/photo-1593874105671-d745ff7ce8ba?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=967&q=80'),
        ),
      ),
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
