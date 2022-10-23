import 'package:flutter/material.dart';
import '../../constants.dart';

class IconContent extends StatelessWidget {
  const IconContent({this.icon, this.label});

  final IconData? icon;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 50.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          label as String,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
