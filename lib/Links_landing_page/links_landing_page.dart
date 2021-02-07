import 'package:flutter/material.dart';

import 'button_link.dart';
import '../constants.dart';
import 'footer.dart';

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
            ButtonLink(
              title: document.title,
              url: document.url,
            ),
          Spacer(),
          Footer(),
          SizedBox(height: 23),
        ],
      ),
    );
    return material;
  }
}
