import 'package:flutter/material.dart';

class ButtonSettingsSection extends StatelessWidget {
  const ButtonSettingsSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
