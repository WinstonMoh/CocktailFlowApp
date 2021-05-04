import 'package:flutter/material.dart';

class AssistantPage extends StatefulWidget {
  @override
  _AssistantPageState createState() => new _AssistantPageState();
}

class _AssistantPageState extends State<AssistantPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Assistant',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
          ),
          Card(
              child: new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new ListTile(
                title: const Text(
                  'Sign In / Sign up',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () {},
                tileColor: Colors.grey[200],
                trailing: const Icon(Icons.chevron_right_rounded),
              ),
            ],
          )),
          Card(
              child: new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new ListTile(
                leading: const Icon(
                  Icons.liquor,
                  size: 50.0,
                  color: Colors.indigo,
                ),
                title: const Text(
                  'My Bar',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                    'Select Ingredients at hand to see what cocktails you can make'),
                onTap: () {},
                isThreeLine: true,
              ),
            ],
          )),
          Card(
              child: new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new ListTile(
                leading: const Icon(
                  Icons.star,
                  size: 50.0,
                  color: Colors.amber,
                ),
                title: const Text(
                  'Favourite Cocktails',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                    'Make cocktails as favourite to have easy access to them'),
                onTap: () {},
                isThreeLine: true,
              ),
            ],
          )),
          Card(
              child: new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new ListTile(
                leading: const Icon(
                  Icons.menu_book,
                  color: Colors.orange,
                  size: 50.0,
                ),
                title: const Text(
                  'My Notes',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                    'Add custom preparation notes or tweaks to cocktails'),
                onTap: () {},
                isThreeLine: true,
              ),
            ],
          )),
          Card(
              child: new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new ListTile(
                leading: const Icon(
                  Icons.book,
                  size: 50.0,
                  color: Colors.lightBlue,
                ),
                title: const Text(
                  'My Cocktails',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                    'Want to capture a recipe we don\'t have? Just add them and we\'ll save and store it for you'),
                onTap: () {},
                isThreeLine: true,
              ),
            ],
          )),
          Card(
              child: new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new ListTile(
                leading: const Icon(
                  Icons.emoji_objects_outlined,
                  size: 50.0,
                  color: Colors.green,
                ),
                title: const Text(
                  'Tips',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                    'Deep dive into some of the more advanced topics around mixology'),
                onTap: () {},
                isThreeLine: true,
              ),
            ],
          )),
          Card(
              child: new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new ListTile(
                leading: const Icon(
                  Icons.library_books_rounded,
                  color: Colors.deepPurpleAccent,
                  size: 50.0,
                ),
                title: const Text(
                  'Cocktail Books',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                    'Our most beloved cocktail books and the sources of the recipes in the app'),
                onTap: () {},
                isThreeLine: true,
              ),
            ],
          ))
        ],
      ),
    );
  }
}
