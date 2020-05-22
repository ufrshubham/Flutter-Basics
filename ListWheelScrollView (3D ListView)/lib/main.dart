import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List Wheel Scroll View',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'List Wheel Scroll View'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListWheelScrollView.useDelegate(
            itemExtent: 200,
            diameterRatio: 3,
            renderChildrenOutsideViewport: true,
            clipToSize: false,
            physics: BouncingScrollPhysics(),
            childDelegate: ListWheelChildBuilderDelegate(
                childCount: 100,
                builder: (context, index) => Container(
                      color: Colors.green,
                      child: Center(
                        child: Text('Item $index'),
                      ),
                    ))));
  }
}
