import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shared Preferences',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Shared Preferences'),
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
  final counts = List<int>(2);
  SharedPreferences pref;

  @override
  void initState() {
    super.initState();

    counts[0] = 0;
    counts[1] = 0;

    SharedPreferences.getInstance().then((value) {
      setState(() {
        pref = value;

        if (pref.getInt('redButton') != null) {
          counts[0] = pref.getInt('redButton');
        }
        if (pref.getInt('blueButton') != null) {
          counts[1] = pref.getInt('blueButton');
        }

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 100.0),
              onPressed: () {
                setState(() {
                  counts[0] += 1;
                  if (pref != null) {
                    pref.setInt('redButton', counts[0]);
                  }
                });
              },
              child: Text(
                '${counts[0]}',
                style: TextStyle(fontSize: 30.0),
              ),
              color: Colors.red,
            ),
            RaisedButton(
              padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 100.0),
              onPressed: () {
                setState(() {
                  counts[1] += 1;
                  if (pref != null) {
                    pref.setInt('blueButton', counts[1]);
                  }
                });
              },
              child: Text(
                '${counts[1]}',
                style: TextStyle(fontSize: 30.0),
              ),
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
