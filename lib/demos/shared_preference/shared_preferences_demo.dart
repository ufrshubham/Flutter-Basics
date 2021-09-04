import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesDemo extends StatefulWidget {
  final String title = 'Shared Preferences';

  @override
  _SharedPreferencesDemoState createState() => _SharedPreferencesDemoState();
}

class _SharedPreferencesDemoState extends State<SharedPreferencesDemo> {
  final counts = List<int>.filled(2, 0);
  SharedPreferences? pref;

  @override
  void initState() {
    super.initState();

    SharedPreferences.getInstance().then((value) {
      setState(() {
        pref = value;

        if (pref!.getInt('redButton') != null) {
          counts[0] = pref!.getInt('redButton')!;
        }
        if (pref!.getInt('blueButton') != null) {
          counts[1] = pref!.getInt('blueButton')!;
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
            TextButton(
              onPressed: () {
                setState(() {
                  counts[0] += 1;
                  if (pref != null) {
                    pref!.setInt('redButton', counts[0]);
                  }
                });
              },
              child: Text(
                'Red Button: ${counts[0]}',
                style: TextStyle(fontSize: 30.0),
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  counts[1] += 1;
                  if (pref != null) {
                    pref!.setInt('blueButton', counts[1]);
                  }
                });
              },
              child: Text(
                'Blue Button: ${counts[1]}',
                style: TextStyle(fontSize: 30.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
