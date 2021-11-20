import 'package:coinkoi/core/style/txt_style.dart';
import 'package:coinkoi/core/theme/color_theme.dart';
import 'package:coinkoi/modules/edit_transaction_module/local_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class SubScreens{
  const SubScreens(
      this.idx,
      this.eController,
      this.investmentId,
      this.symbol,
  );

  final int idx;
  final EditTransactionController eController;
  final int investmentId;
  final String symbol;

  Widget skeletonView(){
    if(idx ==0){
      return Column(
        children: [
          Expanded(child: buyAndSellView(eController, idx)),
          _bottomButton(eController),
        ],
      );
    }else if(idx==1){
      return Column(
        children: [
          Expanded(child: buyAndSellView(eController, idx)),
          _bottomButton(eController),
        ],
      );
    }else{
      return Column(
        children: [
          Expanded(child: transferView()),
          _bottomButton(eController),
        ],
      );
    }

  }

  Widget _bottomButton(EditTransactionController eController){
    return Container(
      child: Row(
        children: [
          const SizedBox(width: 10),
          Expanded(
            flex: 1,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                  primary: koiColor,
                  onSurface: koiColor,
                  side: const BorderSide(
                      color: koiColor,
                      width: 1
                  )
              ),
              onPressed: () {

              },
              child: Text(
                'Cancel',
                style: TxtStyle.button,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 1,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: koiColor
              ),
              onPressed: () {
                // eController.validateAndSave();
              },
              child: Text(
                'Submit',
                style: TxtStyle.button,
              ),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      height: 70,
    );
  }

  Widget buyAndSellView(EditTransactionController eController, int idx) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    introWidget('Price Per Coin'),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6.0),
                            child: TextFormField(
                              style: TxtStyle.body1,
                              cursorColor: koiColor,
                              keyboardType: TextInputType.number,
                              initialValue: "100",
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                              onChanged: (value) => eController.setPPC(value),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const Divider(color: Colors.white70),
                    introWidget('Quantity'),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            style: TxtStyle.body1,
                            cursorColor: koiColor,
                            keyboardType: TextInputType.number,
                            initialValue: "1",
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                            onChanged: (value) => eController.setQuantity(value),
                          ),
                        ),
                        Text(symbol, style: TxtStyle.body1,
                        ),

                      ],
                    ),
                    const Divider(color: Colors.white70),
                    introWidget('Total Spent'),
                    Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey  // green as background color
                        ),
                        child: Obx(() =>
                            Padding(
                                padding: EdgeInsets.fromLTRB(18, 16, 18, 16),
                                child: Text(
                                    eController.currency + ' ' +eController.totalSpent.value.toString(), style: TxtStyle.body4
                                )
                            ),

                        ),
                    ),
                    introWidget('Date'),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            '',
                            style: TxtStyle.body1,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.calendar_today),
                          onPressed: () {

                          },
                        ),
                      ],
                    ),
                    const Divider(color: Colors.white70),
                  ],
                ),
              ),
            ]),
          ),
        )
    );
  }

  Widget transferView() {
    return SafeArea(
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [

                ],
              ),
            ),
          ]),
        )
    );
  }
}