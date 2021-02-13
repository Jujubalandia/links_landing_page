// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:links_landing_page/models/link_data.dart';
import 'package:provider/provider.dart';

class ButtonSettingsSection extends StatelessWidget {
  const ButtonSettingsSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _documents = Provider.of<List<LinkData>>(context);
    if (_documents == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Expanded(
      flex: 3,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            color: Colors.blueGrey.shade50,
            child: Column(
              children: [
                SizedBox(height: 40),
                Text('Your Links',
                    style: Theme.of(context).textTheme.headline1),
                SizedBox(height: 100),
                SizedBox(
                  width: constraints.maxWidth * 0.6,
                  child: FlatButton(
                    padding: EdgeInsets.symmetric(vertical: 25),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      'Add Button',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.blueGrey.shade200,
                    onPressed: () {},
                  ),
                ),
                SizedBox(height: 30),
                SizedBox(
                  width: constraints.maxWidth * 0.6,
                  height: constraints.maxHeight * 0.5,
                  child: ReorderableListView(
                    children: [
                      for (var document in _documents)
                        ListTile(
                          contentPadding: EdgeInsets.symmetric(vertical: 8),
                          title: Text(document.title),
                          key: Key(document.title),
                          leading: Icon(Icons.drag_indicator),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {},
                              )
                            ],
                          ),
                        )
                    ],
                    onReorder: (oldIndex, newIndex) {},
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
