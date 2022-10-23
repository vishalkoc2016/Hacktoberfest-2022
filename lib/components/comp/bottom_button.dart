import 'package:flutter/material.dart';
import '../../constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({required this.buttonTitle, required this.onTap});

  final void Function()? onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: TextStyle(
              color: Color(0xFF0A0E21),
              fontSize: 20.0,
            ),
          ),
        ),
        color: kTextColor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBcHeight,
      ),
    );
  }
}
