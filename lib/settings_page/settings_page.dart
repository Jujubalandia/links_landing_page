import 'package:flutter/material.dart';

import 'buttons_settings_section.dart';
import 'preview_section.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          ButtonSettingsSection(),
          PreviewSection(),
        ],
      ),
    );
  }
}
