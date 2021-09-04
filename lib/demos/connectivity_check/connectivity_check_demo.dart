import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectivityCheckDemo extends StatelessWidget {
  final String title = 'Connectivity check';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: StreamBuilder(
          stream: Connectivity().onConnectivityChanged,
          builder: (BuildContext context,
              AsyncSnapshot<ConnectivityResult> snapshot) {
            if (snapshot.hasData && snapshot.data != ConnectivityResult.none) {
              return Text(
                'Connected',
                style: TextStyle(fontSize: 30),
              );
            } else {
              return Icon(
                Icons.wifi_off,
                size: 50,
              );
            }
          },
        ),
      ),
    );
  }
}
