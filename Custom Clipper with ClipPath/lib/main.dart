import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lets_clip/image_clipper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Clipper',
      theme: ThemeData.light(),
      darkTheme:
          ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.black),
      themeMode: ThemeMode.dark,
      home: MyHomePage(title: 'Custom Clipper'),
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
  int currentIndex = 0;

  static const imageUrls = [
    'https://images.pexels.com/photos/815494/pexels-photo-815494.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    'https://images.pexels.com/photos/1591/technology-music-sound-things.jpg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    'https://images.pexels.com/photos/375751/pexels-photo-375751.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260',
    'https://images.pexels.com/photos/844923/pexels-photo-844923.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    'https://images.pexels.com/photos/1037992/pexels-photo-1037992.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    'https://images.pexels.com/photos/1100538/pexels-photo-1100538.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    'https://images.pexels.com/photos/3394648/pexels-photo-3394648.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    'https://images.pexels.com/photos/933245/pexels-photo-933245.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260',
    'https://images.pexels.com/photos/2011260/pexels-photo-2011260.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    'https://images.pexels.com/photos/324672/pexels-photo-324672.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    'https://images.pexels.com/photos/2346992/pexels-photo-2346992.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    'https://images.pexels.com/photos/1649771/pexels-photo-1649771.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    'https://images.pexels.com/photos/2011258/pexels-photo-2011258.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    'https://images.pexels.com/photos/5382359/pexels-photo-5382359.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    'https://images.pexels.com/photos/610945/pexels-photo-610945.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    'https://images.pexels.com/photos/5269691/pexels-photo-5269691.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    'https://images.pexels.com/photos/5269735/pexels-photo-5269735.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    'https://images.pexels.com/photos/3330855/pexels-photo-3330855.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: imageUrls.length,
        itemBuilder: (BuildContext context, int index) {
          return GridTile(
            child: ClipPath(
              clipper: ImageClipper(),
              // Note: Image.network is used just to avoid dependency on cached_network_image.
              child: Image.network(
                imageUrls.elementAt(index),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
