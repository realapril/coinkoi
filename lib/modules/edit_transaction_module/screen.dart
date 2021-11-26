import 'package:coinkoi/core/theme/color_theme.dart';
import 'package:coinkoi/data/enums.dart';
import 'package:coinkoi/modules/edit_transaction_module/sub_screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class EditTransactionScreen extends StatefulWidget {
  const EditTransactionScreen({Key? key}) : super(key: key);

  @override
  _EditTransaction createState() => _EditTransaction();
}

class _EditTransaction extends State<EditTransactionScreen>  with SingleTickerProviderStateMixin{
  late TabController _tabController;

  late int invId;
  late String symbol;
  late CurrencyType currencyType;
  late String mode;


  @override
  void initState() {
    super.initState();
    Get.arguments[0]['function'];
    invId = Get.arguments[1]['invId'];
    symbol = Get.arguments[2]['symbol'];
    currencyType = Get.arguments[3]['currencyType'];
    mode = Get.arguments[4]['mode'];



    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('${Get.arguments[0]['function']} Transaction'),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: koiColor,
          indicatorWeight: 3,
          labelColor: koiColor,
          unselectedLabelColor: Colors.grey[300],
          tabs: [
            Tab(child: Text('Buy'),),
            Tab(child: Text('Sell'),),
            Tab(child: Text('Transfer'),)
          ],
        ),
      ), //_renderHeaderWidget,
      body: TabBarView(
        controller: _tabController,
        children: [
          SubScreens(0, invId, symbol, context, currencyType).skeletonView(),
          SubScreens(1, invId, symbol, context, currencyType).skeletonView(),
          SubScreens(2, invId, symbol, context, currencyType).skeletonView(),
        ],
      )
    );
  }

}
