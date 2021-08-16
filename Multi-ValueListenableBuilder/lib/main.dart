import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multi_value_listenable_builder/multi_value_listenable_builder.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Multi-ValueListenableBuilder'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ValueNotifier<int> alpha = ValueNotifier(255);
  ValueNotifier<int> red = ValueNotifier(255);
  ValueNotifier<int> green = ValueNotifier(255);
  ValueNotifier<int> blue = ValueNotifier(255);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MultiValueListenableBuider(
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
