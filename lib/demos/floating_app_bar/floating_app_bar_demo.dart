import 'package:flutter/material.dart';

class FloatingAppBarDemo extends StatelessWidget {
  final String title = 'Floating App Bar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            elevation: 50.0,
            expandedHeight: 200,
            flexibleSpace: Image.network(
              'https://yt3.ggpht.com/ytc/AKedOLSdMhKMUtoCz6fEQdNjuvwNNu0_c37FaDgB3uPq=s176-c-k-c0x00ffffff-no-rj',
              height: 150,
              width: 150,
              fit: BoxFit.cover,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => ListTile(
                      title: Text('Item $index'),
                    ),
                childCount: 100),
          )
        ],
      ),
    );
  }
}
