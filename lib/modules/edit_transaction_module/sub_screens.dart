import 'package:coinkoi/core/style/txt_style.dart';
import 'package:coinkoi/core/theme/color_theme.dart';
import 'package:flutter/material.dart';

import 'controller.dart';

class SubScreens{
  Widget skeletonView(int idx, EditTransactionController eController){
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
                    Row(
                      children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            child: Text('Price Per Coin', style: TxtStyle.body3),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
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

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Text('Quantity', style: TxtStyle.body3),
                    ),
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
                        Text('LUNA', style: TxtStyle.body1,
                        ),

                      ],
                    ),
                    const Divider(color: Colors.white70),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Text('Total Spent', style: TxtStyle.body3),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration.collapsed(
                        hintText: 'ss',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('Date', style: TxtStyle.body3),
                    ),

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