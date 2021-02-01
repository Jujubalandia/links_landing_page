import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LinksLandingPage(),
    );
  }
}

class LinksLandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Material(
      child: Column(
        children: [
          SizedBox(height: 8),
          CircleAvatar(
            backgroundImage: NetworkImage(imageUrl),
            backgroundColor: Colors.white,
            radius: 48,
          ),
          SizedBox(height: 12),
          Text(
            '@_Bera_',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 12),
          SizedBox(
            width: width > 680 ? 680 : width * 0.95,
            child: FlatButton(
              padding: EdgeInsets.symmetric(vertical: 20),
              onPressed: () {},
              child: Text(
                'Youtube',
                style: TextStyle(fontSize: 16),
              ),
              color: Colors.tealAccent,
            ),
          )
        ],
      ),
    );
  }
}

final imageUrl =
    'https://pbs.twimg.com/profile_images/781337821147725824/lL5TB1cI_400x400.jpg';
