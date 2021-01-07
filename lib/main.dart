import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _index = 0; // what widget currently displayed.

  List<List<Widget>> _widgets = [
    _discoverSection,
    <Widget>[cocktailsSection],
    <Widget>[ingredientsSection],
    <Widget>[assistantSection],
    <Widget>[moreSection],
  ];

  _tapped(int tappedIndex) {
    setState(() {
      _index = tappedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.varelaRoundTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: Scaffold(
        body: ListView(
          // support app body scrolling on small device.
          children: _widgets[_index].toList(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          onTap: _tapped,
          selectedItemColor: Colors.red,
          type: BottomNavigationBarType.fixed, // for 4 or more items.
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Discover'),
            BottomNavigationBarItem(
                icon: Icon(Icons.local_bar), label: 'Cocktails'),
            BottomNavigationBarItem(
                icon: Icon(Icons.hourglass_bottom_rounded),
                label: 'Ingredients'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: 'Assistant'),
            BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'More'),
          ],
        ),
      ),
    );
  }
}

final Map<String, String> _discoverImages = {
  'https://images.immediate.co.uk/production/volatile/sites/30/2020/08/christmas-cocktails-50f4b96.jpg?quality=90&resize=960,872':
      'Christmas',
  'https://static.onecms.io/wp-content/uploads/sites/9/2013/12/06/2009-xl-martini.jpg':
      'Martini',
  'https://nygal.com/wp-content/uploads/2020/06/pornstar-martini-cocktail-1-1140x570.jpg':
      'Sparkling',
};

List<Widget> _discoverSection = <Widget>[
  Container(
    child: Text(
      'Discover',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30,
      ),
    ),
  ),
  Container(
    child: CarouselSlider(
      options: CarouselOptions(),
      items: _discoverImages.entries
          .map((item) => Column(children: <Widget>[
                Center(
                    child: Image.network(
                  item.key,
                  fit: BoxFit.cover,
                  width: 500,
                  height: 200,
                )),
                Text(item.value,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )),
              ]))
          .toList(),
    ),
  ),
  Container(
    child: Text(
      'Iconic Cocktails',
      style: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 30,
      ),
    ),
  ),
  Container(
    child: Text(
      'Base Spirits',
      style: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 30,
      ),
    ),
  ),
  Container(
    child: Text(
      'Cocktail Type',
      style: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 30,
      ),
    ),
  ),
  Container(
    child: Text(
      'Latest Cocktails',
      style: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 30,
      ),
    ),
  ),
  Container(
    child: Text(
      'Around the World',
      style: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 30,
      ),
    ),
  ),
];

Widget cocktailsSection = Container(
  child: Text(
    'Cocktails',
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 30,
    ),
  ),
);

Widget ingredientsSection = Container(
  child: Text(
    'Ingredients',
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 30,
    ),
  ),
);

Widget assistantSection = Container(
  child: Text(
    'Assistant',
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 30,
    ),
  ),
);

Widget moreSection = Container(
  child: Text(
    'More',
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 30,
    ),
  ),
);
