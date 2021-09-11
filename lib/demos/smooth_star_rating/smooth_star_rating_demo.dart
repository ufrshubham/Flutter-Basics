import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class SmoothStarRatingDemo extends StatelessWidget {
  final String title = 'Smooth Star Rating';

  static const List<double> initialRating = [2, 3, 5, 4.5, 2.5];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: PageView.builder(
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  FlutterLogo(
                    size: 100,
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
