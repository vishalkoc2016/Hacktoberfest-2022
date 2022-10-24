import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, required this.onPressed, this.setState});
  final IconData icon;
  final void Function()? onPressed;
  final TextStyle? setState;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon, size: 15.0, color: Colors.black87),
      onPressed: onPressed,
      textStyle: setState,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 36.0,
        height: 36.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFFA7EEAA),
    );
  }
}
