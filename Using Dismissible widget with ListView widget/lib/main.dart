import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dismissible List View',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Dismissible List View'),
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
  final _myList = List<String>();
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
              background: Container(color: Colors.blue,),
              secondaryBackground: Container(color: Colors.red,),
              onResize: (){
                debugPrint('Being dismissed!!!');
              },
              onDismissed: (direction){
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
