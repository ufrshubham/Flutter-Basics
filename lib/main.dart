import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);
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

class DemoSelectionPage extends StatefulWidget {
  DemoSelectionPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _DemoSelectionPageState createState() => _DemoSelectionPageState();
}

class _DemoSelectionPageState extends State<DemoSelectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text(
          'Flutter Basics',
        ),
      ),
    );
  }
}
