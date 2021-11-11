import 'package:flutter/material.dart';

class InitSettingScreen extends StatefulWidget{
  const InitSettingScreen({Key? key}) : super(key: key);

  @override
  _InitSetting createState()=> _InitSetting();
}

class _InitSetting extends State<InitSettingScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('')),
      body: Center(
        child: Text('initSetting'),
      ),
    );
  }

}