// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:links_landing_page/models/link_data.dart';
import 'package:provider/provider.dart';

import 'add_button.dart';
import 'delete_button.dart';
import 'edit_button.dart';

class ButtonSettingsSection extends StatelessWidget {
  const ButtonSettingsSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _documents = Provider.of<List<LinkData>>(context);
    return ChangeNotifierProxyProvider0<LinkNotifier>(
      create: (context) => LinkNotifier(),
      update: (_, linkNotifier) {
        return linkNotifier..update(_documents);
      },
      child: Expanded(
        flex: 3,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final _linkNotifier = Provider.of<LinkNotifier>(context);
            final width = constraints.maxWidth * 0.6;
            if (_documents == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container(
              color: Colors.blueGrey.shade50,
              child: Column(
                children: [
                  SizedBox(height: 30),
                  Text('Your Links',
                      style: Theme.of(context).textTheme.headline1),
                  SizedBox(height: 85),
                  AddButton(width: width),
                  SizedBox(height: 30),
                  SizedBox(
                    width: constraints.maxWidth * 0.6,
                    height: constraints.maxHeight * 0.5,
                    child: ReorderableListView(
                      children: [
                        for (var document in _linkNotifier.currentLinkList)
                          ListTile(
                            contentPadding: EdgeInsets.symmetric(vertical: 8),
                            title: Text(document.title),
                            key: Key(document.title),
                            leading: Icon(Icons.drag_indicator),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                DeleteButton(document: document),
                                EditButton(document: document),
                              ],
                            ),
                          )
                      ],
                      onReorder: _linkNotifier.onReorder,
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class LinkNotifier extends ChangeNotifier {
  List<LinkData> _workingList;

  update(List<LinkData> userLinks) => _workingList = userLinks;

  List<LinkData> get currentLinkList => _workingList;

  void onReorder(oldIndex, newIndex) {
    if (oldIndex < newIndex) newIndex -= 1;
    final pickedLink = _workingList.removeAt(oldIndex);
    _workingList.insert(newIndex, pickedLink);

    final batch = FirebaseFirestore.instance.batch();

    for (var document in _workingList) {
      final index = _workingList.indexOf(document);
      batch.update(document.documentReference, {'position': index});
    }

    batch.commit();
  }
}
