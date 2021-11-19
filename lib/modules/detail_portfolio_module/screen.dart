import 'package:coinkoi/core/theme/color_theme.dart';
import 'package:coinkoi/data/provider/db_provider.dart';
import 'package:coinkoi/modules/detail_portfolio_module/controller.dart';
import 'package:coinkoi/modules/detail_portfolio_module/local_widgets/appbar.dart';
import 'package:coinkoi/modules/detail_portfolio_module/local_widgets/custom_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:coinkoi/data/services/service.dart';

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
    return Scaffold(
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(()=> DetailPortfolioAppBar(isDataLoaded() ? getInvestment().coin_icon :"" , isDataLoaded() ? getInvestment().coin_symbol :"", context)),
                      _buildHoldings(),
                      _buildTotalCost(),
                      _buildAveNetCost(),
                      _buildPnL(),
                      Divider(),
                      _buildTransaction(),
                    ],
                  )
              ),
            ),
            _buildBottomButton(),
          ],
        )
    );
  }

  Widget _buildBottomButton(){
    return Container(
      child: Row(
        children: [
          const SizedBox(width: 20),
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: koiColor,
                  // padding: EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                  // minimumSize: Size(1000, 40),
                  textStyle: const TextStyle(
                    fontSize: 18,
                  )),
              onPressed: () {
                Get.toNamed('/editTransaction', arguments: [{"invId": Get.arguments[0]['investmentId']}, {"from": "detail"}]);
              },
              child: const Text('+ Add transaction'),
            ),
          ),
          const SizedBox(width: 20),

        ],
      ),
      height: 70,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[700],
      ),
    );
  }

  Widget _buildHoldings(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(()=> Text(isDataLoaded() ? getInvestment().holdings.toString()+ " "+ getInvestment().coin_symbol :"" )),
        // Text("${Get.arguments[0]['investmentId'].toString()}"),
        Text("Holdings"),
      ],
    );
  }

  Widget _buildTotalCost(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(()=> Text(isDataLoaded() ? getInvestment().currency+ getInvestment().totalCost.toString() :"" )),
        Text("Total Cost"),
      ],
    );
  }

  Widget _buildAveNetCost(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(()=> Text(isDataLoaded() ? getInvestment().currency+ getInvestment().aveNetCost.toString() :"" )),
        Text("Average Net Cost"),
      ],
    );
  }

  Widget _buildPnL(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(()=> Text(isDataLoaded() ? getInvestment().currency+ getInvestment().PnL.toString() :"" )),
        Text("Profit/Loss"),
      ],
    );
  }

  Widget _buildTransaction(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Transaction History"),
        StreamBuilder<List<SavedTransactionData>>(
            stream: Get.find<DbService>().getStreamTransactions(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final data = snapshot.data!;
                return Text('data');
                // return ListView.separated(
                //   physics: const ClampingScrollPhysics(),
                //   itemBuilder: (_, index) {
                //     final item = data[index];
                //
                //     return CustomDetailListTile(
                //       id: item.coin_sid,
                //       portfolioId: item.id,
                //       icon: item.coin_icon,
                //       symbol: item.coin_symbol,
                //       pnl: item.PnL,
                //       holdings: item.holdings,
                //       totalCost: item.totalCost,
                //       currency: item.currency,
                //     );
                //   },
                //   separatorBuilder: (_, index) {
                //     return Divider();
                //   },
                //   itemCount: data.length,
                //   shrinkWrap: true,
                // );
              } else if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              } else {
                print('else');
                return Container();
              }
            })
      ],
    );
  }

  bool isDataLoaded(){
    return dpController.investmentInfo.isNotEmpty;
  }

  SavedInvestmentData getInvestment(){
    return dpController.investmentInfo[0];
  }



}

//
