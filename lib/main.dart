import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:links_landing_page/Links_landing_page/links_landing_page.dart';
import 'package:links_landing_page/models/link_data.dart';
import 'package:links_landing_page/not_found_page.dart';
import 'package:links_landing_page/settings_page/settings_page.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseFirestore.instance.settings = Settings(
    host: 'localhost:8080',
    sslEnabled: false,
    persistenceEnabled: false,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('links').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final _documents = snapshot.data.docs.map((doc) {
            return LinkData.fromMap(doc.data());
          }).toList();
          return ProxyProvider0<List<LinkData>>(
            update: (context, linkDataList) => _documents,
            child: MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              initialRoute: '/',
              routes: {
                '/': (context) => LinksLandingPage(),
                '/settings': (context) => SettingsPage(),
              },
              onUnknownRoute: (settings) {
                return MaterialPageRoute(
                  builder: (context) {
                    return NotFoundPage();
                  },
                );
              },
            ),
          );
        });
  }
}
