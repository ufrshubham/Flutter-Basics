import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream Builder + Cloud Firestore',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Stream Builder + Cloud Firestore'),
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
        body: StreamBuilder(
          stream: Firestore.instance.collection('songs').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return PageView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.network(snapshot.data.documents
                          .elementAt(index)['album_cover']),
                      Text(
                        snapshot.data.documents.elementAt(index)['title'],
                        style: TextStyle(fontSize: 30.0),
                      ),
                      Text(
                        snapshot.data.documents.elementAt(index)['artist'],
                        style: TextStyle(fontSize: 20.0),
                      ),
                      Text(
                        snapshot.data.documents.elementAt(index)['album'],
                        style: TextStyle(fontSize: 20.0),
                      ),
                      Text(
                        snapshot.data.documents.elementAt(index)['year'],
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ],
                  );
                },
              );
            } else {
              debugPrint('Loading...');
              return Center(
                child: Text('Loading...'),
              );
            }
          },
        ));
  }
}
