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
                SizedBox(height: 180),
              ],
            ),
          );
        },
      ),
    );
  }
}
