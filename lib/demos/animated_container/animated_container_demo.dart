import 'package:flutter/material.dart';

class AnimatedContainerDemo extends StatefulWidget {
  final String title = 'Animated Container';

  @override
  _AnimatedContainerDemoState createState() => _AnimatedContainerDemoState();
}

class _AnimatedContainerDemoState extends State<AnimatedContainerDemo> {
  final selection = List<bool>.filled(10, false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: 6,
        itemBuilder: _buildAnimatedContainer,
      ),
    );
  }

  Widget _buildAnimatedContainer(BuildContext context, int index) {
    return ListTile(
      contentPadding: EdgeInsets.all(10.0),
      onTap: () {
        setState(() {
          selection[index] = !selection[index];
        });
      },
      title: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        color: selection[index] ? Colors.black : Colors.red,
        margin: EdgeInsets.all(selection[index] ? 30.0 : 10.0),
      ),
    );
  }
}
