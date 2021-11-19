import 'package:coinkoi/core/theme/color_theme.dart';
import 'package:coinkoi/modules/portfolio_module/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditTransactionScreen extends StatefulWidget {
  const EditTransactionScreen({Key? key}) : super(key: key);

  @override
  _EditTransaction createState() => _EditTransaction();
}

class _EditTransaction extends State<EditTransactionScreen>  with SingleTickerProviderStateMixin{
  final PortfolioController pController = Get.put(PortfolioController());
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    Get.arguments[0]['invId'];
    Get.arguments[1]['from'];
    Get.arguments[2]['function'];
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('${Get.arguments[2]['function']} Transaction'),
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
            Text('1'),
          Text('2'),
          Text('3'),

        ],
      )
    );
  }


  Widget _v() {
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
