import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_search/search.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SearchDelegate',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'SearchDelegate'),
      debugShowCheckedModeBanner: false,
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
      body: ListView.builder(
        itemCount: names.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(
              names.elementAt(index),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: () async {
          final result = await showSearch<String>(
            context: context,
            delegate: NameSearch(names),
          );

          print(result);
        },
      ),
    );
  }
}

const names = [
  "Camila	Chapman",
  "Belinda	Cameron",
  "Amelia	Harris",
  "Aldus	Howard",
  "Mike	Ryan",
  "Adelaide	Perry",
  "Derek	Hall",
  "Cherry	Ryan",
  "Derek	Owens",
  "John	Walker",
  "Belinda	Ferguson",
  "Vanessa	Barrett",
  "Julian	Foster",
  "Jasmine	Evans",
  "Sabrina	Hunt",
  "Deanna	Carroll",
  "Hailey	Murray",
  "Maximilian	Crawford",
  "Grace	Wright",
  "Garry	Murphy",
  "Catherine	Ferguson",
  "Amelia	Watson",
  "Alisa	Baker",
  "Maria	Miller",
  "Daisy	Harper",
  "Michelle	West",
  "Caroline	Taylor",
  "Heather	West",
  "Justin	Lloyd",
  "Lydia	Cameron",
  "Daryl	Harris",
  "Tara	Robinson",
  "Haris	Wells",
  "Emily	Scott",
  "Catherine	Wells",
  "Ned	Murphy",
  "Blake	Casey",
  "Chelsea	Mitchell",
  "Stuart	Reed",
  "Ellia	Jones",
  "Florrie	Lloyd",
  "Blake	Barnes",
  "Jack	Cole",
  "Adele	Henderson",
  "Jessica	Rogers",
  "Florrie	Barrett",
  "Ryan	Owens",
  "Briony	Dixon",
  "Alexander	Cole",
  "Jessica	Casey",
  "Ryan	Grant",
  "Emily	Fowler",
  "Edith	Turner",
  "Max	Payne",
  "Melanie	Davis",
  "Lucas	Mitchell",
  "Aldus	Warren",
  "Ashton	Kelley",
  "Frederick	Armstrong",
  "Chester	Smith",
  "Alissa	Riley",
  "Bruce	Rogers",
  "Edgar	Armstrong",
  "Cadie	Cooper",
  "Ryan	Scott",
  "Rebecca	Campbell",
  "Rebecca	Parker",
  "Grace	Bennett",
  "Alen	Cunningham",
  "Lucia	Douglas",
  "Sydney	Allen",
  "Roland	Cole",
  "Eddy	Lloyd",
  "Haris	Murphy",
  "Fiona	Farrell",
  "Honey	Jones",
  "Edward	Watson",
  "Ada	Harris",
  "Jordan	Owens",
  "Carlos	Stevens",
  "Alissa	Howard",
  "Madaline	Smith",
  "Luke	Carroll",
  "Paul	Campbell",
  "Adrian	Murray",
  "Ashton	Brown",
  "Ned	Harris",
  "Michelle	Thomas",
  "Ted	Evans",
  "Adelaide	Hawkins",
  "Sydney	Hall",
  "Arnold	Ross",
  "Clark	Stewart",
  "Carl	Smith",
  "Vivian	Watson",
  "Sam	Wells",
  "Arnold	Stevens",
  "Vivian	Miller",
  "John	Hawkins",
  "Edgar	Payne",
];
