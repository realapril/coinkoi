import 'package:coinkoi/data/model/model.dart';
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
                onPressed: (){
                  Get.toNamed('/editTransaction');
                }
            ),
            // Text("${Get.arguments['symbol']}")
            Text((Get.arguments as Coin).name)
          ],
        )
      )
    );
  }
}