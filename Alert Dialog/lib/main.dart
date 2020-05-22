import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Basics',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Alert Dialog - Demo'),
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
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: RaisedButton(
            color: Colors.lightBlue,
        padding: EdgeInsets.all(20.0),
        child: Icon(Icons.thumb_up),
        onPressed: () {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context){
              return AlertDialog(
                title: Text('Alert from DevKage'),
                content: Text('Have you subscribed yet?'),
                actions: <Widget>[
                  FlatButton(child: Text('Yes'), onPressed: (){
                    Navigator.pop(context);
                  },),
                  FlatButton(child: Text('No'), onPressed: (){
                    Navigator.pop(context);
                  },)
                ],
              ); 
            }
          );
        },
      )),
    );
  }
}
