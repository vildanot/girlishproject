import 'package:flutter/material.dart';


InputDecoration kInputDecoration = InputDecoration(
    labelText: 'E-mail',
    labelStyle: TextStyle(
      fontFamily: 'Monserrat',
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.green)
    )
);


const kBottomContainerHeight = 60.0;
const kActiveCardColour = Colors.grey;
const kInactiveCardColour = Colors.blueGrey;
const kBottomContainerColour = Color(0xff97e37b);

const kLabelTextStyle = TextStyle(
  fontSize: 20.0,
  color: Colors.black,
);

const kNumberTextStyle = TextStyle(
  fontSize: 30.0,
  fontWeight: FontWeight.w900,
  color: Colors.black
);

const kLargeButtonTextStyle = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
);

const kTitleTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.bold,
);

const kResultTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 22.0,
  fontWeight: FontWeight.bold,
);

const kBMITextStyle = TextStyle(
  fontSize: 100.0,
  fontWeight: FontWeight.bold,
  color: Colors.white
);

const kBodyTextStyle = TextStyle(
  fontSize: 22.0,
  color: Colors.white,
);
