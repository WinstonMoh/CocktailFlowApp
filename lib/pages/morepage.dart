import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MorePage extends StatefulWidget {
  @override
  _MorePageState createState() => new _MorePageState();
}

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Container(
          child: Text(
            'Settings',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40,
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 1.0),
        child: Container(
          child: Text(
            'Subscription',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17.0, vertical: 1.0),
        child: Card(
            child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new ListTile(
              leading: const Icon(
                Icons.star,
                size: 40.0,
                color: Colors.amber,
              ),
              title: const Text(
                'Join Cocktail Flow Premium',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {},
              tileColor: Colors.grey[200],
            ),
          ],
        )),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17.0, vertical: 1.0),
        child: Card(
            child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new ListTile(
              title: const Text(
                'Restore Subscription',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {},
              tileColor: Colors.grey[200],
            ),
          ],
        )),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17.0, vertical: 1.0),
        child: Card(
            child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new ListTile(
              title: const Text(
                'Enter Promo Code',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {},
              tileColor: Colors.grey[200],
            ),
          ],
        )),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17.0, vertical: 1.0),
        child: Card(
            child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new ListTile(
              title: const Text(
                'Previously purchased cocktail packages',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {},
              tileColor: Colors.grey[200],
            ),
          ],
        )),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17.0, vertical: 1.0),
        child: Card(
            child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new ListTile(
              title: const Text(
                'Invite your friends',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {},
              tileColor: Colors.grey[200],
            ),
          ],
        )),
      ),
      Padding(
        padding: const EdgeInsets.only(
            left: 20.0, right: 11.0, top: 40.0, bottom: 1.0),
        child: Container(
          child: Text(
            'Localisation Settings',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 20,
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17.0, vertical: 1.0),
        child: Card(
            child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new ListTile(
              title: const Text(
                'Select your language...',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {},
              tileColor: Colors.grey[200],
              trailing: Icon(Icons.chevron_right_rounded),
            ),
          ],
        )),
      ),
      Padding(
        padding: const EdgeInsets.only(
            left: 20.0, right: 11.0, top: 40.0, bottom: 1.0),
        child: Container(
          child: Text(
            'Feedback',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 20,
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17.0, vertical: 1.0),
        child: Card(
            child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new ListTile(
              title: const Text(
                'Say hi anytime',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {},
              tileColor: Colors.grey[200],
            ),
          ],
        )),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17.0, vertical: 1.0),
        child: Card(
            child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new ListTile(
              title: const Text(
                'Rate Cocktail flow',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {},
              tileColor: Colors.grey[200],
            ),
          ],
        )),
      ),
      Padding(
        padding: const EdgeInsets.only(
            left: 20.0, right: 11.0, top: 40.0, bottom: 1.0),
        child: Container(
          child: Text(
            'About The Team...',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 20,
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17.0, vertical: 1.0),
        child: Card(
            child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new ListTile(
              leading: Icon(EvaIcons.twitter),
              title: const Text(
                'on Twitter',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                _launchUrl('https://twitter.com');
              },
              tileColor: Colors.grey[200],
            ),
          ],
        )),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17.0, vertical: 1.0),
        child: Card(
            child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new ListTile(
              leading: Icon(EvaIcons.facebook),
              title: const Text(
                'on Facebook',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                _launchUrl('https://facebook.com');
              },
              tileColor: Colors.grey[200],
            ),
          ],
        )),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17.0, vertical: 1.0),
        child: Card(
            child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new ListTile(
              title: const Text(
                'Privacy Policy',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {},
              tileColor: Colors.grey[200],
              trailing: const Icon(Icons.chevron_right_rounded),
            ),
          ],
        )),
      ),
    ]));
  }

  _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
