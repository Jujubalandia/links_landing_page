import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    Key key,
    @required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
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
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Add New Button'),
                  content: Form(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Title',
                            hintText: 'ex: Facebook',
                          ),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Link',
                            hintText: 'ex: facebook.com/you-user-name',
                          ),
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    FlatButton(
                      onPressed: () {},
                      child: Text('Add'),
                    ),
                    FlatButton(
                      onPressed: () {},
                      child: Text('Cancel'),
                    ),
                  ],
                );
              });
        },
      ),
    );
  }
}
