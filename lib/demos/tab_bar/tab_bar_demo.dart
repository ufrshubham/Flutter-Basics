import 'package:flutter/material.dart';

class TabBarDemo extends StatelessWidget {
  final String title = 'Tab Bar';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
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
        ),
      ),
    );
  }

  ListView _buildListViewWithName(String s) {
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        title: Text(s + ' $index'),
      ),
    );
  }
}
