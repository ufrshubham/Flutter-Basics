import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StreamBuilderCloudFirestoreDemo extends StatefulWidget {
  final String title = 'Stream Builder + Cloud Firestore';

  @override
  _StreamBuilderCloudFirestoreDemoState createState() =>
      _StreamBuilderCloudFirestoreDemoState();
}

class _StreamBuilderCloudFirestoreDemoState
    extends State<StreamBuilderCloudFirestoreDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('songs').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return PageView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.network(
                        snapshot.data!.docs.elementAt(index)['album_cover']),
                    Text(
                      snapshot.data!.docs.elementAt(index)['title'],
                      style: TextStyle(fontSize: 30.0),
                    ),
                    Text(
                      snapshot.data!.docs.elementAt(index)['artist'],
                      style: TextStyle(fontSize: 20.0),
                    ),
                    Text(
                      snapshot.data!.docs.elementAt(index)['album'],
                      style: TextStyle(fontSize: 20.0),
                    ),
                    Text(
                      snapshot.data!.docs.elementAt(index)['year'],
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
      ),
    );
  }
}
