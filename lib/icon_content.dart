import 'package:flutter/material.dart';

import 'constants.dart';

class IconContent extends StatelessWidget {
  const IconContent({
    this.iconData,
    this.text,
  });

  final IconData iconData;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(iconData, size: 80),
          SizedBox(height: 15.0),
          Text(text, style: kTextStyle)
        ]);
  }
}
