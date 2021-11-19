import 'package:coinkoi/data/provider/db_provider.dart';
import 'package:coinkoi/data/services/service.dart';
import 'package:coinkoi/modules/portfolio_module/controller.dart';
import 'package:coinkoi/modules/portfolio_module/local_widgets/appbar.dart';
import 'package:coinkoi/modules/portfolio_module/local_widgets/custom_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditTransactionScreen extends StatefulWidget {
  const EditTransactionScreen({Key? key}) : super(key: key);

  @override
  _EditTransaction createState() => _EditTransaction();
}

class _EditTransaction extends State<EditTransactionScreen> {
  final PortfolioController pController = Get.put(PortfolioController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppBar(), //_renderHeaderWidget,
      body: SafeArea(
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
      ),
    );
  }


  Widget _customVerticalDivider() {
    return Container(
      width: 1,
      height: double.maxFinite,
      color: Colors.grey[850],
    );
  }
}
