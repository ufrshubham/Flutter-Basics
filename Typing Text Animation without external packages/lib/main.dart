import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Typing Text Animation',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.black,
          textTheme: TextTheme(bodyText2: TextStyle(fontSize: 25))),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Typing Text Animation'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin<MyHomePage> {
  // Strigns for the three widgets.
  final stringForTweenAnimationBuidler =
      'From TweenAnimationBuilder';
  final stringForAnimatedBuilder = 'From AnimatedBuidler';
  final stringForTypingTextWidget = 'From TypingText';

  // Single controller for AnimatedBuilder and TypingText.
  AnimationController controller;

  // Two animations for AnimatedBuilder and TypingText.
  Animation<int> animationForAnimatedBuilder;
  Animation<int> animationForTypingText;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));

    animationForAnimatedBuilder =
        IntTween(begin: 0, end: stringForAnimatedBuilder.length)
            .animate(controller);
    animationForTypingText =
        IntTween(begin: 0, end: stringForTypingTextWidget.length)
            .animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TweenAnimationBuilder<int>(
                duration: const Duration(seconds: 3),
                tween: IntTween(
                    begin: 0, end: stringForTweenAnimationBuidler.length),
                builder: (BuildContext context, int value, Widget child) {
                  return Text(
                      stringForTweenAnimationBuidler.substring(0, value));
                },
              ),
              AnimatedBuilder(
                animation: animationForAnimatedBuilder,
                builder: (BuildContext context, Widget child) {
                  return Text(stringForAnimatedBuilder.substring(
                      0, animationForAnimatedBuilder.value));
                },
              ),
              TypingText(
                string: stringForTypingTextWidget,
                animation: animationForTypingText,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow_rounded),
        onPressed: () {
          controller.repeat(reverse: true);
        },
      ),
    );
  }
}

class TypingText extends AnimatedWidget {
  final String string;

  TypingText({this.string, Key key, Listenable animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<int>;
    return Text(string.substring(0, animation.value));
  }
}
