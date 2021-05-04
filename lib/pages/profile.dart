import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final logoutAction;
  final String email;
  final String picture;

  Profile(this.logoutAction, this.email, this.picture);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          Container(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.chevron_left_rounded)),
              Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Profile',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Raleway',
                    fontSize: 40,
                  ),
                ),
              ),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 4.0),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(picture ?? ''),
                  ),
                ),
              ),
              SizedBox(height: 24.0),
              Text('Email address\n$email'),
              SizedBox(height: 48.0),
              ElevatedButton(
                onPressed: () {
                  logoutAction();
                  Navigator.pop(context);
                },
                child: Text('Logout'),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateColor.resolveWith((states) => Colors.red)),
              ),
            ],
          ))
        ]));
  }
}
