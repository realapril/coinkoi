import 'package:coinkoi/data/services/service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moor_db_viewer/moor_db_viewer.dart';

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
        child: ElevatedButton(
          child: Text(
            'open',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            // Get.bottomSheet(
            //   customBottom()
            // );
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => MoorDbViewer(Get.find<DbService>().db)));
          },
        ),
      ),
    );
  }

}