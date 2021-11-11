import 'package:coinkoi/modules/edit_transaction_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPortfolioScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DetailPortfolio"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: (){
            Get.toNamed('/editTransaction');
          }
        ),
      )
    );
  }
}