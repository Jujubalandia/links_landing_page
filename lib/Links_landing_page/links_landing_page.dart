import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'button_link.dart';
import '../constants.dart';
import 'footer.dart';

class LinksLandingPage extends StatelessWidget {
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
        });
  }
}
