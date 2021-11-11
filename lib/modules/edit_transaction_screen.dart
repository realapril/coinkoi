import 'package:coinkoi/modules/btm_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditTransactionScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EditTransaction"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: (){
            // Get.back();
            //TODO 포폴에서 바로 편집했을경우 밑의것을사용
            Get.offAllNamed('/');

          },
          child: Text("save"),)
      ),
    );
  }
}