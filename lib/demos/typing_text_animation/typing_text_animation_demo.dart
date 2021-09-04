import 'package:flutter/material.dart';

class TypingTextAnimationDemo extends StatefulWidget {
  final String title = 'Typing Text Animation';

  @override
  _TypingTextAnimationDemoState createState() =>
      _TypingTextAnimationDemoState();
}

class _TypingTextAnimationDemoState extends State<TypingTextAnimationDemo>
    with SingleTickerProviderStateMixin<TypingTextAnimationDemo> {
  // Strigns for the three widgets.
  final stringForTweenAnimationBuidler = 'From TweenAnimationBuilder';
  final stringForAnimatedBuilder = 'From AnimatedBuidler';
  final stringForTypingTextWidget = 'From TypingText';

  // Single controller for AnimatedBuilder and TypingText.
  late AnimationController controller;

  // Two animations for AnimatedBuilder and TypingText.
  late Animation<int> animationForAnimatedBuilder;
  late Animation<int> animationForTypingText;

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
                builder: (context, value, child) {
                  return Text(
                      stringForTweenAnimationBuidler.substring(0, value));
                },
              ),
              AnimatedBuilder(
                animation: animationForAnimatedBuilder,
                builder: (context, child) {
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

  TypingText({required this.string, Key? key, required Listenable animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<int>;
    return Text(string.substring(0, animation.value));
  }
}
