import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'demo_selector.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  runApp(FlutterBasics());
}

class FlutterBasics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Basics',
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DemoSelectionPage(title: 'Flutter Basics'),
    );
  }
}
