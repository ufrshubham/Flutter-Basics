import 'package:flutter/material.dart';

class RadioDemo extends StatefulWidget {
  final String title = 'Radio';

  @override
  _RadioDemoState createState() => _RadioDemoState();
}

enum Type { Type1, Type2, Type3, Type4 }
const Map<Type, IconData> iconMap = {
  Type.Type1: Icons.account_circle,
  Type.Type2: Icons.photo,
  Type.Type3: Icons.settings,
  Type.Type4: Icons.video_collection
};

class _RadioDemoState extends State<RadioDemo> {
  Type myType = Type.Type1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconMap[myType],
              size: 200.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio<Type>(
                  value: Type.Type1,
                  groupValue: myType,
                  onChanged: (Type? type) {
                    setState(() {
                      myType = type ?? myType;
                    });
                  },
                ),
                Radio<Type>(
                  value: Type.Type2,
                  groupValue: myType,
                  onChanged: (Type? type) {
                    setState(() {
                      myType = type ?? myType;
                    });
                  },
                ),
                Radio<Type>(
                  value: Type.Type3,
                  groupValue: myType,
                  onChanged: (Type? type) {
                    setState(() {
                      myType = type ?? myType;
                    });
                  },
                ),
                Radio<Type>(
                  value: Type.Type4,
                  groupValue: myType,
                  onChanged: (Type? type) {
                    setState(() {
                      myType = type ?? myType;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
