import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slider Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Slider Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double sliderValue = 0.0;
  String sliderString = '0.0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25.0),
          child: Container(
            color: Colors.black,
            height: 50,
            child: Slider(
              value: sliderValue,
              min: 0,
              max: 100,
              divisions: 4,
              label: sliderString,
              onChanged: (value) {
                setState(
                  () {
                    sliderValue = value;
                    sliderString = value.round().toString();
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
