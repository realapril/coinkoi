import 'package:coinkoi/core/style/txt_style.dart';
import 'package:coinkoi/core/theme/color_theme.dart';
import 'package:coinkoi/modules/edit_transaction_module/local_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class SubScreens {
  const SubScreens(
    this.idx,
    this.investmentId,
    this.symbol,
    this.context,
  );

  final int idx;
  final int investmentId;
  final String symbol;
  final BuildContext context;

  Widget skeletonView() {
    final EditTransactionController eController0 = Get.put(EditTransactionController(), tag: "buy");
    eController0.currentDateStr.value = eController0.setCurrentDate();
    eController0.type = 'buy';
    final GlobalKey<FormState> _formKey0 = GlobalKey<FormState>();


    final EditTransactionController eController1 = Get.put(EditTransactionController(), tag: "sell");
    eController1.currentDateStr.value = eController1.setCurrentDate();
    eController1.type = 'sell';
    final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();


    if (idx == 0) {
      return Column(
        children: [
          Expanded(child: buyAndSellView(eController0, idx, _formKey0)),
          _bottomButton(eController0, _formKey0),
        ],
      );
    } else if (idx == 1) {
      return Column(
        children: [
          Expanded(child: buyAndSellView(eController1, idx, _formKey1)),
          _bottomButton(eController1, _formKey1),
        ],
      );
    } else {
      return Column(
        children: [
          Expanded(child: transferView()),
          // _bottomButton(eController),
        ],
      );
    }
  }

  Widget _bottomButton(EditTransactionController eController, GlobalKey<FormState> _formKey) {
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
                  side: const BorderSide(color: koiColor, width: 1)),
              onPressed: () {
                Get.back();
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
                  primary: Colors.white, backgroundColor: koiColor),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                  eController.validateAndSave(_formKey);
                  Get.back();
                }
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

  Widget buyAndSellView(EditTransactionController eController, int idx, GlobalKey<FormState> _formKey) {
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
                    GestureDetector(
                      // onTap: , //TODO
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: eController.currency,
                              style: TxtStyle.body1,
                            ),
                            const WidgetSpan(
                              child: Icon(Icons.keyboard_arrow_down, size: 23),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6.0),
                        child: TextFormField(
                          validator: (value) {
                            if (eController.isValidate(value)) {
                              return null;
                            } else {
                              return "Not valid";
                            }
                          },
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
                        validator: (value) {
                          if (eController.isValidate(value)) {
                            return null;
                          } else {
                            return "Not valid";
                          }
                        },
                        cursorColor: koiColor,
                        keyboardType: TextInputType.number,
                        initialValue: "1",
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        onChanged: (value) => eController.setQuantity(value),
                      ),
                    ),
                    Text(
                      symbol,
                      style: TxtStyle.body1,
                    ),
                  ],
                ),
                const Divider(color: Colors.white70),
                introWidget('Total Spent'),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey[600] // green as background color
                      ),
                  child: Obx(
                    () => Padding(
                        padding: const EdgeInsets.fromLTRB(18, 16, 18, 16),
                        child: Text(
                            eController.currency + ' ' +
                                eController.totalSpent.value.toString(),
                            style: TxtStyle.body4)),
                  ),
                ),
                const SizedBox(height: 10,),
                introWidget('Date'),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        child: Obx(
                          () => Text(
                            eController.currentDateStr.value,
                            style: TxtStyle.body1,
                          ),
                        ),
                        onTap: ()=> _showDatePicker(eController),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.calendar_today_outlined),
                      onPressed: () {
                        _showDatePicker(eController);
                      }
                    ),
                  ],
                ),
                const Divider(color: Colors.white70),
              ],
            ),
          ),
        ]),
      ),
    ));
  }

  void _showDatePicker(EditTransactionController eController){
    showDatePicker(
        context: context,
        initialDate: eController.currentDateTime,
        firstDate: DateTime(eController.currentDateTime.year - 10),
        lastDate: DateTime(eController.currentDateTime.year + 50)).then((date) => {
      if(date !=null){
        eController.setNewDate(date)
        }
      }
    );
  }

  Widget transferView() {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [],
          ),
        ),
      ]),
    ));
  }
}
