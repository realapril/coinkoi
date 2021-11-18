import 'package:coinkoi/data/provider/db_provider.dart';
import 'package:coinkoi/modules/detail_portfolio_module/controller.dart';
import 'package:coinkoi/modules/detail_portfolio_module/local_widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPortfolioScreen extends StatefulWidget {
  const DetailPortfolioScreen({Key? key}) : super(key: key);

  @override
  _DetailPortfolioScreen createState() => new _DetailPortfolioScreen();
}

class _DetailPortfolioScreen extends State<DetailPortfolioScreen> {
  final DetailPortfolioController dpController = Get.put(DetailPortfolioController());
  late SavedCoinData coinData;
  @override
  void initState() {
    super.initState();
    Get.arguments[0]['investmentId'];
    Get.arguments[1]['coinId'];
    dpController.getPortfolio(Get.arguments[0]['investmentId']);
    // print(dpController.coinList[0]);
    // dpController.getCoin(Get.arguments['id']);
  }



  @override
  Widget build(BuildContext context) {
    // if(dpController.investmentInfo.isNotEmpty){
    //   return _bulidSuccessScreen();
    // }else{
    //   return _buildFailureScreen();
    // }
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(()=> DetailPortfolioAppBar(isDataLoaded() ? getInvestment().coin_icon :"" , isDataLoaded() ? getInvestment().coin_symbol :"", context)),
                // Text("${Get.arguments[0]['investmentId'].toString()}"),
                Obx(()=> Text( isDataLoaded() ? getInvestment().currency :"")),

                // Text((Get.arguments as Coin).name)
              ],
            )
        )
    );;
  }

  // Widget _bulidSuccessScreen(){
  //
  // }

  bool isDataLoaded(){
    return dpController.investmentInfo.isNotEmpty;
  }

  SavedInvestmentData getInvestment(){
    return dpController.investmentInfo[0];
  }


  // Widget _buildFailureScreen(){
  //   return const Scaffold(
  //       body:  Text('Wait a second..')
  //
  //   );
  // }
}

// Get.toNamed('/editTransaction');
