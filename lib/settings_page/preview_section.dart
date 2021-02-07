import 'package:flutter/material.dart';
import 'package:links_landing_page/Links_landing_page/links_landing_page.dart';

class PreviewSection extends StatelessWidget {
  const PreviewSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 28.0),
            child: Text(
              'Preview Section',
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          SizedBox(height: 28),
          Expanded(child: LinksLandingPage()),
          SizedBox(height: 100),
        ],
      ),
    );
  }
}
