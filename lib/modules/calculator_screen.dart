import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget{
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  _Calculator createState()=> _Calculator();
}

class _Calculator extends State<CalculatorScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('')),
      body: Center(
        child: Text('cal'),
      ),
    );
  }

}