import 'package:flutter/material.dart';

// class CustomTextTheme{
//   var customs= const TextTheme(
//     headline1: TextStyle(fontSize: 13.0),//For appbar
//     headline2: TextStyle(fontSize: 36.0),//for tabbar
//     headline3: TextStyle(fontSize: 36.0),//body 1st size
//     headline4: TextStyle(fontSize: 36.0),//body 2nd size
//     headline5: TextStyle(fontSize: 14.0),//body 3rd size
//     headline6: TextStyle(fontSize: 36.0),//recyclerview header
//     bodyText1: TextStyle(fontSize: 14.0, fontFamily: 'Hind', color: Colors.red),
//     bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind', color: Colors.green),
//     // caption: TextStyle(fontSize: 14.0, fontFamily: 'Hind', color: Colors.green),
//     // button: TextStyle(fontSize: 14.0, fontFamily: 'Hind', color: Colors.green),
//     // overline: TextStyle(fontSize: 14.0, fontFamily: 'Hind', color: Colors.green),
//   );
// }

TextTheme _customTextTheme(TextTheme base) {
  return base
      .copyWith(
    headline5: base.headline5!.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 26.0,
    ),
    headline6: base.headline6!.copyWith(fontSize: 22.0),
    caption: base.caption!.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 18.0,
    ),
    bodyText1: base.bodyText1!.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 16.0,
    ),
  )
      .apply(
    fontFamily: 'Trajan Pro',
    displayColor: const Color(0xFF442B2D),
    bodyColor: const Color(0xFF883B2D),
  );
}