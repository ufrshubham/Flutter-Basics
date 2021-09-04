import 'package:flutter/material.dart';

class AlertDialogDemo extends StatelessWidget {
  final String title = 'Alert Dialog';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: ElevatedButton(
          child: Icon(Icons.thumb_up),
          onPressed: () {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Alert from DevKage'),
                  content: Text('Have you subscribed yet?'),
                  actions: <Widget>[
                    TextButton(
                      child: Text('Yes'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    TextButton(
                      child: Text('No'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
