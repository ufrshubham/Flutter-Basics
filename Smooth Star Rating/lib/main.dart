import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Star Rating Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Star Rating Demo'),
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
  static const List<double> initialRating = [2, 3, 5, 4.5, 2.5];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: PageView.builder(
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Image.asset(
                    'assets/${index + 1}.jpg',
                    fit: BoxFit.fill,
                    gaplessPlayback: true,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: SmoothStarRating(
                      size: 40.0,
                      color: Colors.yellow,
                      rating: initialRating[index],
                      onRated: (double value) {
                        debugPrint(
                            'Image no. $index was rated $value stars!!!');
                      },
                      borderColor: Colors.green,
                      allowHalfRating: false,
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
