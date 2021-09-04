import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerDemo extends StatelessWidget {
  final String title = 'Shimmer';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: StreamBuilder(
        stream: getData().asStream(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            final result = json.decode(snapshot.data!);
            return ListView.builder(
              itemCount: result['songs'].length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Image.network(
                      result['songs'].elementAt(index)['album_cover'],
                    ),
                    title: Text(
                      result['songs'].elementAt(index)['title'],
                    ),
                  ),
                );
              },
            );
          } else {
            return Shimmer.fromColors(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.image, size: 50.0),
                    title: SizedBox(
                      child: Container(
                        color: Colors.green,
                      ),
                      height: 20.0,
                    ),
                  );
                },
              ),
              baseColor: Colors.grey,
              highlightColor: Colors.teal,
            );
          }
        },
      ),
    );
  }
}

Future<String> getData() {
  final data = {
    'songs': [
      {
        'album_cover':
            'https://upload.wikimedia.org/wikipedia/en/e/e8/Linkin_Park_-_Papercut_CD_cover.jpg',
        'title': 'Linkin Park - Papercut',
      },
      {
        'album_cover':
            'https://upload.wikimedia.org/wikipedia/en/3/38/When_We_All_Fall_Asleep%2C_Where_Do_We_Go%3F.png',
        'title': 'Bury a Friend - Billie Eilish',
      },
      {
        'album_cover':
            'https://upload.wikimedia.org/wikipedia/en/c/ce/Imagine_Dragons_-_Smoke_%2B_Mirrors.png',
        'title': 'Gold - Imagine Dragons',
      },
      {
        'album_cover':
            'https://upload.wikimedia.org/wikipedia/en/e/ea/Recovery_Eminem_Alternative_Cover.jpg',
        'title': 'Space Bound - Eminem',
      },
      {
        'album_cover':
            'https://upload.wikimedia.org/wikipedia/en/c/c4/Marshmello_Silence.jpg',
        'title': 'Silence - Marshmello ft. Khalid',
      }
    ]
  };

  return Future.delayed(Duration(seconds: 1), () => json.encode(data));
}
