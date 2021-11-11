import 'package:flutter/material.dart';

class MoreScreen extends StatefulWidget{
  const MoreScreen({Key? key}) : super(key: key);

  @override
  _More createState()=> _More();
}

class _More extends State<MoreScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('')),
      body: Center(
        child: Text('more'),
      ),
    );
  }

}