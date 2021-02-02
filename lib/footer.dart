import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Made with Love',
          style: TextStyle(fontSize: 19),
        ),
        SizedBox(
          width: 8,
        ),
        Image.network(
          'https://icons.iconarchive.com/icons/icons-land/vista-love/256/Sex-Male-Female-icon.png',
          width: 20,
        )
      ],
    );
  }
}
