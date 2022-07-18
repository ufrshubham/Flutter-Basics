import 'package:flutter/material.dart';
import 'package:multi_value_listenable_builder/multi_value_listenable_builder.dart';

class MultiValueListenableBuilderDemo extends StatelessWidget {
  final ValueNotifier<int> alpha = ValueNotifier(255);
  final ValueNotifier<int> red = ValueNotifier(255);
  final ValueNotifier<int> green = ValueNotifier(255);
  final ValueNotifier<int> blue = ValueNotifier(255);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MultiValueListenableBuilder(
              valueListenables: [alpha, red, green, blue],
              builder: (context, values, child) {
                return Container(
                  height: 200,
                  width: 200,
                  color: Color.fromARGB(
                    values.elementAt(0),
                    values.elementAt(1),
                    values.elementAt(2),
                    values.elementAt(3),
                  ),
                );
              },
            ),
            ValueListenableBuilder<int>(
              valueListenable: alpha,
              builder: (context, value, child) {
                return Slider(
                  min: 0,
                  max: 255,
                  value: value.toDouble(),
                  onChanged: (newValue) => alpha.value = newValue.toInt(),
                );
              },
            ),
            ValueListenableBuilder<int>(
              valueListenable: red,
              builder: (context, value, child) {
                return Slider(
                  min: 0,
                  max: 255,
                  value: value.toDouble(),
                  onChanged: (newValue) => red.value = newValue.toInt(),
                );
              },
            ),
            ValueListenableBuilder<int>(
              valueListenable: green,
              builder: (context, value, child) {
                return Slider(
                  min: 0,
                  max: 255,
                  value: value.toDouble(),
                  onChanged: (newValue) => green.value = newValue.toInt(),
                );
              },
            ),
            ValueListenableBuilder<int>(
              valueListenable: blue,
              builder: (context, value, child) {
                return Slider(
                  min: 0,
                  max: 255,
                  value: value.toDouble(),
                  onChanged: (newValue) => blue.value = newValue.toInt(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
