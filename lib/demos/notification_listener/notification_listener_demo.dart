import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class NotificationListenerDemo extends StatefulWidget {
  final String title = 'Notification Listeners';

  @override
  _NotificationListenerDemoState createState() =>
      _NotificationListenerDemoState();
}

class _NotificationListenerDemoState extends State<NotificationListenerDemo> {
  bool showFab = false;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          setState(() {
            if (notification.direction == ScrollDirection.forward) {
              showFab = false;
            } else if (notification.direction == ScrollDirection.reverse) {
              showFab = true;
            }
          });
          return true;
        },
        child: ListView.builder(
          itemCount: 200,
          controller: _scrollController,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text('Item $index'),
            );
          },
        ),
      ),
      floatingActionButton: showFab
          ? FloatingActionButton(
              child: Icon(Icons.arrow_downward_rounded),
              onPressed: () {
                _scrollController
                    .jumpTo(_scrollController.position.maxScrollExtent);
              },
            )
          : null,
    );
  }
}
