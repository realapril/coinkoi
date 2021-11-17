import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    required this.id,
    required this.portfolioId,
    required this.icon,
    required this.symbol,
    required this.pnl,
    required this.holdings,
    required this.totalCost,
    required this.currency
  });

  final int id;
  final int portfolioId;
  final String icon;
  final String symbol;
  final double pnl;
  final double holdings;
  final double totalCost;
  final String currency;

  @override
  Widget build(BuildContext context) {
    final PortfolioController pController = Get.put(PortfolioController());

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: GestureDetector(
        onTap: ()=> Get.toNamed("/detailPortfolio", arguments: {"id": id}),
        onLongPress: (){
          final act = customCupertino(pController, context);
          showCupertinoModalPopup(
              context: context,
              builder: (BuildContext context) => act);
          },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(image: AssetImage(icon)),
                  Text(symbol, textAlign: TextAlign.center)
                ],
              ),
            ),
            Expanded(flex: 2,
                child: Text( pnl.toString() +"%  ", textAlign: TextAlign.right ,
                    style: TextStyle(
                    color: pnl < 0 ? Colors.red : Colors.green ),
            )),
            Expanded(flex: 3,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [

                    Text(currency +" "+ totalCost.toString(), textAlign: TextAlign.right ), //TODO make currency changeable
                    Text(holdings.toString() + " " + symbol, textAlign: TextAlign.right)
                  ],
                ),
            ),
            const Expanded(flex: 2,
              child: Center(
                child: Icon(
                    Icons.add , size: 28.0
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customCupertino(PortfolioController pController, BuildContext context){
    return CupertinoActionSheet(
        actions: <Widget>[
          CupertinoActionSheetAction(
            child: Text('Remove from portfolio'),
            onPressed: () {
              pController.deleteCoin(id);
              pController.deletePortfolio(portfolioId);
            },
          )
        ],
        cancelButton: CupertinoActionSheetAction(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.pop(context);
          },
        ));
  }
}