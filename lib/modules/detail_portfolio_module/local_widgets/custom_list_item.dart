import 'package:coinkoi/core/style/txt_style.dart';
import 'package:coinkoi/data/provider/db_provider.dart';
import 'package:coinkoi/modules/detail_portfolio_module/local_widgets/bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controller.dart';

class CustomDetailListTile extends StatelessWidget {
  const CustomDetailListTile({
    required this.data,
    required this.currency,
    required this.symbol,

  });

  final SavedTransactionData data;
  final String currency;
  final String symbol;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          buildInvestmentUI(),
        ],
      ),
    );
  }



  Widget buildInvestmentUI(){
    return Expanded(flex: 7,
        child: GestureDetector(
          onTap: ()=> Get.bottomSheet(customBottom(data, currency, symbol)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.arrow_forward),
                    Text(" "+data.type, style: TxtStyle.body1),
                    const Spacer(),
                    Text(data.quantity.toString()+" "+symbol , style: TxtStyle.body1),
                    const Icon(Icons.arrow_right),
                  ],
                ),
              ),
              Row(children: [
                const SizedBox(width: 16),
                Text(DateFormat.yMMMd().format(data.updatedAt), style: TxtStyle.body2,),
                const Spacer(),
                Text(currency +data.cost.toString() , style: TxtStyle.body2,),
                const SizedBox(width: 16)
              ],
              )
            ],
          )
        )
    );
  }
  




}


