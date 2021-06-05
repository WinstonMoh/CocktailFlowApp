import 'package:cocktail_flow/pages/assistantpage.dart';
import 'package:cocktail_flow/pages/cocktailspage.dart';
import 'package:cocktail_flow/pages/discoverpage.dart';
import 'package:cocktail_flow/pages/ingredientspage.dart';
import 'package:cocktail_flow/pages/morepage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _index; // what widget is currently displayed.
  List<Widget> _pages;
  PageController _pageController;

  _tapped(int tappedIndex) {
    setState(() {
      _index = tappedIndex;
      _pageController.jumpToPage(tappedIndex);
    });
  }

  @override
  void initState() {
    super.initState();

    _index = 1;
    _pageController = PageController(initialPage: _index);
    _pages = [
      DiscoverPage(),
      CocktailsPage(),
      IngredientsPage(),
      AssistantPage(),
      MorePage(),
    ];
  }

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
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
        body: PageView(
          // support app body scrolling on small device.
          children: _pages,
          //bucket: _bucket,
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
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
