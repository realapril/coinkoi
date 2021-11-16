import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//https://www.codegrepper.com/code-examples/dart/custom+listtile+flutter
class CustomListTile extends StatelessWidget {
  const CustomListTile({
    required this.icon,
    required this.symbol,
    required this.pnl,
    required this.holdings,
    required this.totalCost,
  });

  final String icon;
  final String symbol;
  final double pnl;
  final double holdings;
  final double totalCost;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
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

                  Text("\$ "+ totalCost.toString(), textAlign: TextAlign.right ), //TODO make currency changeable
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
    );
  }
}