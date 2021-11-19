import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    required this.id,
    required this.investmentId,
    required this.icon,
    required this.symbol,
    required this.pnl,
    required this.holdings,
    required this.totalCost,
    required this.currency
  });

  final int id;
  final int investmentId;
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          buildInvestmentUI(pController, context),
          buildTransactionUI(),
        ],
      ),
    );
  }


  Widget buildInvestmentUI(PortfolioController pController, BuildContext context){
    return Expanded(flex: 7,
        child: GestureDetector(
          onTap: ()=> Get.toNamed("/detailPortfolio", arguments: [{"investmentId": investmentId}, {"coinId": id}]),
          onLongPress: (){
            final act = customCupertino(pController, context);
            showCupertinoModalPopup(
                context: context,
                builder: (BuildContext context) => act);
          },
          child: Row(
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
            ],
          ),
        )
    );
  }
  
  Widget buildTransactionUI(){
    return Expanded(flex: 2,
      child: GestureDetector(
        onTap: ()=> Get.toNamed("/editTransaction", arguments: [
          {"invId": investmentId},
          {"function": "Add"},
        ]),
        child: const Center(
          child: Icon(
              Icons.add , size: 28.0
          ),
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
              pController.deleteInvestment(investmentId);
              Navigator.pop(context);
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


