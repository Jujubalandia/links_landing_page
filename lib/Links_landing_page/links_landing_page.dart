import 'package:flutter/material.dart';
import 'package:links_landing_page/models/link_data.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import 'button_link.dart';
import 'footer.dart';

class LinksLandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _documents = Provider.of<List<LinkData>>(context);
    if (_documents == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Material(
      child: Column(
        children: [
          SizedBox(height: 35),
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
          if (_documents.isEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 58.8),
              child: Text('Whoops have not added some links!'),
            ),
          for (var document in _documents)
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
  }
}
