import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    Key key,
    @required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    TextEditingController _titleTextController = TextEditingController();
    TextEditingController _urlTextController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
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
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          validator: (value) {
                            return value.isEmpty ? 'Please add a title' : null;
                          },
                          controller: _titleTextController,
                          decoration: InputDecoration(
                            labelText: 'Title',
                            hintText: 'ex: Facebook',
                          ),
                        ),
                        TextFormField(
                          validator: (value) {
                            return value.isEmpty ? 'Please add a url' : null;
                          },
                          controller: _urlTextController,
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
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          Navigator.of(context).pop();
                          _formKey.currentState.reset();
                        }
                        print(_titleTextController.text);
                        print(_urlTextController.text);
                      },
                      child: Text('Add'),
                    ),
                    FlatButton(
                      onPressed: () => Navigator.of(context).pop(),
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
