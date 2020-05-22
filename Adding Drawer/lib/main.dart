import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drawer Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Drawer Demo'),
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
  String string = 'Drawer';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerScrimColor: Colors.green,
      endDrawer: Drawer(
        child: Column(children: <Widget>[
          DrawerHeader(child: Icon(Icons.account_circle, size: 150.0),),
          ListTile(title: Text('Item 1'), onTap: (){
            setState(() {
              string = 'You pressed item 1';
            });
            Navigator.pop(context);
          }),
          ListTile(title: Text('Item 2'), onTap: (){
            setState(() {
              string = 'You pressed item 2';
            });
            Navigator.pop(context);
          }),
          ListTile(title: Text('Item 3'), onTap: (){
            setState(() {
              string = 'You pressed item 3';
            });
            Navigator.pop(context);
          })
        ],),
      ),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text(string, style: TextStyle(fontSize: 40.0),),
        ),
    );
  }
}
