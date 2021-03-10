import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'buttons_settings_section.dart';
import 'preview_section.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          FlatButton.icon(
            onPressed: () => FirebaseAuth.instance.signOut(),
            icon: Icon(Icons.logout),
            label: Text('Sign out'),
          ),
        ],
      ),
      body: Row(
        children: [
          ButtonSettingsSection(),
          PreviewSection(),
        ],
      ),
    );
  }
}
