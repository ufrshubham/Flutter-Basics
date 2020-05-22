import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snack Bar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Snack Bar Demo'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SnackbarLauncherButton(),
      ),
    );
  }
}

class SnackbarLauncherButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('Launch Snackbar'),
      onPressed: (){
        final snackbar = SnackBar(
          content: Text('Hey, thanks for launching me!!!', style: TextStyle(fontSize: 20),),
          action: SnackBarAction(label: 'Undo',
          onPressed: (){
            debugPrint('Undo pressed.');
          },),
        );

        Scaffold.of(context).showSnackBar(snackbar);
      },
    );
  }

}
