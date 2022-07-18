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
            flexibleSpace: FlutterLogo(
              size: 150,
              style: FlutterLogoStyle.horizontal,
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
