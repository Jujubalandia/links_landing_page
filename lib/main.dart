import 'package:flutter/material.dart';
import 'package:links_landing_page/links_landing_page.dart';
import 'package:links_landing_page/settings_page.dart';

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
      initialRoute: '/',
      routes: {
        '/': (context) => LinksLandingPage(),
        '/settings': (context) => SettingsPage(),
      },
    );
  }
}
