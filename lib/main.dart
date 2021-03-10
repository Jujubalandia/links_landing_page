import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:links_landing_page/Links_landing_page/links_landing_page.dart';
import 'package:links_landing_page/login_page/login_page.dart';
import 'package:links_landing_page/models/link_data.dart';
import 'package:links_landing_page/not_found_page.dart';
import 'package:links_landing_page/settings_page/settings_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final linksCollection = FirebaseFirestore.instance.collection('links');
    final userLinkDataStream = linksCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return LinkData.fromDocument(doc);
      }).toList();
    });

    return MultiProvider(
      providers: [
        StreamProvider<User>(
            create: (context) => FirebaseAuth.instance.authStateChanges()),
        Provider<CollectionReference>(
          create: (context) => linksCollection,
        ),
        StreamProvider<List<LinkData>>(
          create: (context) => userLinkDataStream,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'App Card',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        onGenerateRoute: (settings) {
          return MaterialPageRoute(builder: (context) {
            return RouteController(settingsName: settings.name);
          });
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
  }
}

class RouteController extends StatelessWidget {
  final String settingsName;
  const RouteController({
    Key key,
    @required this.settingsName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userSignedIn = Provider.of<User>(context) != null;
    final notSignedInGoSettings = !userSignedIn && settingsName == '/settings';
    final signedInGoSettings = userSignedIn && settingsName == '/settings';

    if (settingsName == '/') {
      return LinksLandingPage();
    } else if (notSignedInGoSettings || settingsName == '/login') {
      return LoginPage();
    } else if (signedInGoSettings) {
      return SettingsPage();
    } else {
      return NotFoundPage();
    }
  }
}
