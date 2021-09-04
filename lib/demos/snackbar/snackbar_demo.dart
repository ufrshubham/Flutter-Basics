import 'package:flutter/material.dart';

class SnackBarDemo extends StatelessWidget {
  final String title = 'Snack Bar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
          child: ElevatedButton(
        child: Text('Launch Snackbar'),
        onPressed: () {
          final snackBar = SnackBar(
            content: Text(
              'Hey, thanks for launching me!!!',
              style: TextStyle(fontSize: 20),
            ),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                debugPrint('Undo pressed.');
              },
            ),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
      )),
    );
  }
}
