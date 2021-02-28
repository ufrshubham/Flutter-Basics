import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final Future<void> future;
  final Widget navigateTo;

  SplashScreen({
    Key key,
    @required this.future,
    @required this.navigateTo,
  })  : assert(future != null),
        assert(navigateTo != null),
        super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    controller.forward();

    widget.future.then((_) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => widget.navigateTo,
      ));
    });
  }

  @override
  void dispose() { 
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget child) {
            return Opacity(
              opacity: animation.value,
              child: child,
            );
          },
          child: Image.network('https://lh3.googleusercontent.com/a-/AOh14GiH2FfWPKH5Z9FE98kYa3P-LuDDUPMR3B5U7g4X=s600-k-no-rp-mo'),
        ),
      ),
    );
  }
}
