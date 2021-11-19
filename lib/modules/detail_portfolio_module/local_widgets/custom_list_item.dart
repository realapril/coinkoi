import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller.dart';

class CustomDetailListTile extends StatelessWidget {
  const CustomDetailListTile({
    required this.id,
    required this.type,
    required this.updatedAt,
    required this.symbol,
    required this.quantity,
    required this.totalCost,
    required this.currency
  });

  final int id;
  final String type;
  final String updatedAt;
  final String symbol;
  final double quantity;
  final double totalCost;
  final String currency;

  @override
  Widget build(BuildContext context) {
    final DetailPortfolioController pController = Get.put(DetailPortfolioController());

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // buildInvestmentUI(pController, context),
        ],
      ),
    );
  }


  // Widget buildInvestmentUI(DetailPortfolioController pController, BuildContext context){
  //   return Expanded(flex: 7,
  //       child: GestureDetector(
  //         onTap: ()=> Get.toNamed("/detailPortfolio", arguments: [{"investmentId": portfolioId}, {"coinId": id}]),
  //         child: Row(
  //           children: <Widget>[
  //             Expanded(flex: 2,
  //               child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   Image(image: AssetImage(icon)),
  //                   Text(symbol, textAlign: TextAlign.center)
  //                 ],
  //               ),
  //             ),
  //             Expanded(flex: 2,
  //                 child: Text( pnl.toString() +"%  ", textAlign: TextAlign.right ,
  //                   style: TextStyle(
  //                       color: pnl < 0 ? Colors.red : Colors.green ),
  //                 )),
  //             Expanded(flex: 3,
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.stretch,
  //                 children: [
  //
  //                   Text(currency +" "+ totalCost.toString(), textAlign: TextAlign.right ), //TODO make currency changeable
  //                   Text(holdings.toString() + " " + symbol, textAlign: TextAlign.right)
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       )
  //   );
  // }
  




}


