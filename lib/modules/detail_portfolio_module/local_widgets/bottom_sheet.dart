
import 'package:coinkoi/core/style/txt_style.dart';
import 'package:coinkoi/core/theme/color_theme.dart';
import 'package:coinkoi/data/enums.dart';
import 'package:coinkoi/data/provider/db_provider.dart';
import 'package:coinkoi/modules/detail_portfolio_module/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

Widget customBottom(SavedTransactionData data, String currency, String symbol){
  return Container(
    decoration: BoxDecoration(
      color: Colors.grey[800],
    ),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text('Transaction Details' , style: TxtStyle.body5)
          ),
          SizedBox(
            height: 270,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _oneRow('Type', data.type.stringValues),
                  _oneRow('Date', DateFormat.yMMMd().format(data.updatedAt)),
                  _oneRow('Price Per Coin', currency + data.ppc.toString()),
                  _oneRow('Quantity', data.quantity.toString() + " " + symbol),
                  _oneRow('Fees', currency + '0'),
                  _oneRow('Cost', currency + data.cost.toString()),
                  _noteRow('sample note'),
                ],
              ),
            ),
          ),
          _buildBottomButton(data.id),
        ],
      ),
    ),
  );

}

Widget _oneRow(String key, String value){
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Row(
      children: [
        Text(key , style: TxtStyle.body6),
        const Spacer(),
        Text(value , style: TxtStyle.body7),
      ],
    ),
  );
}

Widget _noteRow(String notes){
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Text('Notes', style: TxtStyle.body3_bold),

  );
}

Widget _buildBottomButton(int transactionId) {
  final DetailPortfolioController dpController = Get.put(DetailPortfolioController());
  return Container(
    child: Row(
      children: [
        Expanded(
          flex: 1,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
                primary: koiColor,
                onSurface: koiColor,
                side: const BorderSide(color: koiColor, width: 1)),
            onPressed: () {
                Get.back();
                dpController.deleteTransaction(transactionId);
            },
            child: Text(
              'Delete',
              style: TxtStyle.button,
            ),
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          flex: 1,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
                primary: Colors.white, backgroundColor: koiColor),
                onPressed: () {
              // if (_formKey.currentState!.validate()) {
              //   ScaffoldMessenger.of(context).showSnackBar(
              //     SnackBar(
              //       content: Container(
              //         // color: Colors.white,
              //         decoration: BoxDecoration(color: Colors.grey[700], borderRadius: BorderRadius.circular(10)),
              //         margin: const EdgeInsets.fromLTRB(0, 0, 0, 70),
              //         child:
              //         Padding(
              //           padding: const EdgeInsets.all(18.0),
              //           child: Text('Successfully saved', style: TxtStyle.button,),
              //         ),
              //       ),
              //       // behavior: SnackBarBehavior.floating,
              //       // content: Text('Successfully saved'),
              //       backgroundColor: Colors.transparent,
              //     ),
              //   );
              //   eController.validateAndSave(_formKey);
              //   Get.back();
              // }
            },
            child: Text(
              'Edit',
              style: TxtStyle.button,
            ),
          ),
        ),
      ],
    ),
    height: 40,
  );
}