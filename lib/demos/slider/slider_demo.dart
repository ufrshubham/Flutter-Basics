import 'package:flutter/material.dart';

class SliderDemo extends StatefulWidget {
  final String title = 'Slider';

  @override
  _SliderDemoState createState() => _SliderDemoState();
}

class _SliderDemoState extends State<SliderDemo> {
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
