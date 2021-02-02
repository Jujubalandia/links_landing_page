import 'dart:html';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
    var material = Material(
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
          for (var document in documents)
            ButtonLink(title: document['title'], url: document['url']),
        ],
      ),
    );
    return material;
  }
}

final documents = [
  {'title': 'Youtube', 'url': 'https://youtube.com'},
  {'title': 'LinkedIn', 'url': 'https://linkedin.com'},
  {'title': 'Podcast', 'url': 'https://uol.com.br'},
];

class ButtonLink extends StatelessWidget {
  const ButtonLink({
    Key key,
    @required this.title,
    @required this.url,
  }) : super(key: key);

  final String title;
  final String url;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: SizedBox(
        width: width > 680 ? 680 : width * 0.95,
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 25),
          onPressed: () => launch(url),
          child: Text(
            title,
            style: TextStyle(fontSize: 16),
          ),
          color: Colors.tealAccent,
        ),
      ),
    );
  }
}

final imageUrl =
    'https://pbs.twimg.com/profile_images/781337821147725824/lL5TB1cI_400x400.jpg';
