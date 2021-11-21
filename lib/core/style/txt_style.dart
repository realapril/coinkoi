import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TxtStyle{
  static TextStyle sample = const TextStyle(
  color: Colors.black,
  decoration: TextDecoration.underline,
  decorationColor: Colors.red,
  decorationStyle: TextDecorationStyle.wavy,
      fontWeight: FontWeight.bold,
      fontSize: 20
  );

  static TextStyle body1 = const TextStyle(
      fontSize: 18,
  );

  static TextStyle body2 = const TextStyle(
      fontSize: 14,
      color: Colors.grey,
  );

  static TextStyle body3 = const TextStyle(
    fontSize: 14,
    color: Colors.white
  );

  static TextStyle body4 = const TextStyle(
    fontSize: 20,
  );

  static TextStyle body5 = const TextStyle(
    fontSize: 24,
  );

  static TextStyle button = const TextStyle(
    fontSize: 18,
    color: Colors.white
  );

  static TextStyle appBar = const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20
  );
}
