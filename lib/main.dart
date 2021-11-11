import 'package:coinkoi/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // scaffoldBackgroundColor: Colors.grey.shade900,
        // primaryColor: Colors.black,
        // colorScheme: ColorScheme.dark(),

        brightness: Brightness.dark,
        primaryColor: const Color(0xFFcc5533),
      ),
      home: Home(),
    );
  }
}