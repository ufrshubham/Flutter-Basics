import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('First Page', style: TextStyle(fontSize: 50.0),),),);
  }
}

class SecondPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Second Page',style: TextStyle(fontSize: 50.0),),),);
  }
}

class ThirdPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Third Page',style: TextStyle(fontSize: 50.0),),),);
  }
}
