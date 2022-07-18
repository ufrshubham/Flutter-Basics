import 'package:flutter/material.dart';
import 'image_clipper.dart';

class CustomClipperDemo extends StatelessWidget {
  final String title = 'Custom Clipper';

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
      appBar: AppBar(
        title: Text(title),
      ),
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
