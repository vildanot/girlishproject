import 'package:flutter/material.dart';
import 'package:loginpage/calculator/bmi_calculator/constants.dart';
class BottomButton extends StatelessWidget {
  BottomButton({@required this.onTap, @required this.buttonTitle});

  final Function onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: kLargeButtonTextStyle,
          ),
        ),
        color: kBottomContainerColour,
        margin: EdgeInsets.only(top: 30.0, bottom: 30.0),
        padding: EdgeInsets.only(bottom: 20.0), 
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}
