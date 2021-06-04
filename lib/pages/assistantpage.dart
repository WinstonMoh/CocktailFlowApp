import 'package:cocktail_flow/pages/profile.dart';
import 'package:flutter/material.dart';

/// -----------------------------------
///          External Packages
/// -----------------------------------

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final FlutterAppAuth appAuth = FlutterAppAuth();
final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

/// -----------------------------------
///           Auth0 Variables
/// -----------------------------------

const AUTH0_DOMAIN = 'dev-zbml3g0o.us.auth0.com';
const AUTH0_CLIENT_ID = '9rEGQErP0PS4BScmQxTPmiksYZwXRo1G';

const AUTH0_REDIRECT_URI = 'com.auth0.flutterdemo://login-callback';
const AUTH0_ISSUER = 'https://$AUTH0_DOMAIN';

class AssistantPage extends StatefulWidget {
  const AssistantPage({Key key}) : super(key: key);
  @override
  _AssistantPageState createState() => new _AssistantPageState();
}

class _AssistantPageState extends State<AssistantPage> {
  bool isBusy = false;
  bool isLoggedIn = false;
  String errorMessage;
  String name;
  String email;
  String picture;

  @override
  Widget build(BuildContext context) {
    return new ListView(children: <Widget>[
      Container(
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
                  title: isLoggedIn
                      ? Text(
                          'Logged in as \n$email',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      : Text(
                          'Log into account',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                  onTap: () {
                    isBusy
                        ? CircularProgressIndicator()
                        : isLoggedIn
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => (Profile(
                                        logoutAction, email, picture))))
                            : loginAction(); //Login(loginAction, errorMessage);
                  },
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
      )
    ]);
  }

  Map<String, dynamic> parseIdToken(String idToken) {
    final parts = idToken.split(r'.');
    assert(parts.length == 3);

    return jsonDecode(
        utf8.decode(base64Url.decode(base64Url.normalize(parts[1]))));
  }

  Future<Map> getUserDetails(String accessToken) async {
    final url = 'https://$AUTH0_DOMAIN/userinfo';
    final response =
        await http.get(url, headers: {'Authorization': 'Bearer $accessToken'});

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to get user details');
    }
  }

  Future<void> loginAction() async {
    setState(() {
      isBusy = true;
      errorMessage = '';
    });

    try {
      final AuthorizationTokenResponse result =
          await appAuth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(AUTH0_CLIENT_ID, AUTH0_REDIRECT_URI,
            issuer: 'https://$AUTH0_DOMAIN',
            scopes: ['openid', 'profile', 'offline_access', 'email'],
            promptValues: ['login']),
      );

      final idToken = parseIdToken(result.idToken);
      final profile = await getUserDetails(result.accessToken);

      await secureStorage.write(
          key: 'refresh_token', value: result.refreshToken);

      setState(() {
        isBusy = false;
        isLoggedIn = true;
        name = idToken['name'];
        email = idToken['email'];
        picture = profile['picture'];
      });
      print("login: ");
      print(isLoggedIn);
    } catch (e, s) {
      print('login error: $e - stack: $s');

      setState(() {
        isBusy = false;
        isLoggedIn = false;
        errorMessage = e.toString();
      });
    }
  }

  void logoutAction() async {
    await secureStorage.delete(
        key: 'refresh_token'); // remove any refresh token from local storage.
    setState(() {
      isLoggedIn = false;
      isBusy = false;
    });
  }

  @override
  void initState() {
    initAction();
    super.initState();
  }

  void initAction() async {
    final storedRefreshToken = await secureStorage.read(
        key: 'refresh_token'); // get stored refreshToken
    if (storedRefreshToken == null) {
      print("token is null");
      return;
    }
    print(isLoggedIn);
    print("token is NOT null");

    setState(() {
      isBusy = true;
    });

    try {
      final response = await appAuth.token(TokenRequest(
        AUTH0_CLIENT_ID,
        AUTH0_REDIRECT_URI,
        issuer: AUTH0_ISSUER,
        refreshToken: storedRefreshToken,
      ));

      // response.accessTokenExpirationDateTime: check for accessTokenExpirationDateTime in response to use or not.

      final idToken = parseIdToken(response.idToken);
      final profile = await getUserDetails(response.accessToken);

      secureStorage.write(key: 'refresh_token', value: response.refreshToken);

      setState(() {
        isBusy = false;
        isLoggedIn = true;
        name = idToken['name'];
        email = idToken['email'];
        picture = profile['picture'];
      });
    } catch (e, s) {
      print('error on refresh token: $e - stack: $s');
      logoutAction();
    }
  }
}
