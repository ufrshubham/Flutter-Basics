import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'ListView Demo'),
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
        ));
  }
}
