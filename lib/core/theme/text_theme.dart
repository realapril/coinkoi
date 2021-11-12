import 'package:flutter/material.dart';

class CustomTextTheme{
  var customs= const TextTheme(
    headline1: TextStyle(fontSize: 13.0),//For appbar
    headline2: TextStyle(fontSize: 36.0),//for tabbar
    headline3: TextStyle(fontSize: 36.0),//body 1st size
    headline4: TextStyle(fontSize: 36.0),//body 2nd size
    headline5: TextStyle(fontSize: 14.0),//body 3rd size
    headline6: TextStyle(fontSize: 36.0),//recyclerview header
    bodyText1: TextStyle(fontSize: 14.0, fontFamily: 'Hind', color: Colors.red),
    bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind', color: Colors.green),
    // caption: TextStyle(fontSize: 14.0, fontFamily: 'Hind', color: Colors.green),
    // button: TextStyle(fontSize: 14.0, fontFamily: 'Hind', color: Colors.green),
    // overline: TextStyle(fontSize: 14.0, fontFamily: 'Hind', color: Colors.green),
  );
}