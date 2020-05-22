import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tabs',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Tabs Demo'),
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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            bottom: TabBar(
              indicatorWeight: 10.0,              
              tabs: <Widget>[
                Tab(
                  text: 'Incoming Call',
                ),
                Tab(
                  text: 'Outgoing Call',
                ),
                Tab(
                  text: 'Missed Call',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              _buildListViewWithName('Incoming Call'),
              _buildListViewWithName('Outgoing Call'),
              _buildListViewWithName('Missed Call'),
            ],
          )),
    );
  }

  ListView _buildListViewWithName(String s) {
    return ListView.builder(itemBuilder: (context, index)=>ListTile(
      title: Text(s+' $index'),
    ));
  }
}
