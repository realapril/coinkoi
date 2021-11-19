import 'package:coinkoi/core/style/txt_style.dart';
import 'package:coinkoi/core/theme/color_theme.dart';
import 'package:coinkoi/data/provider/db_provider.dart';
import 'package:coinkoi/modules/detail_portfolio_module/controller.dart';
import 'package:coinkoi/modules/detail_portfolio_module/local_widgets/appbar.dart';
import 'package:coinkoi/modules/detail_portfolio_module/local_widgets/bottom_sheet.dart';
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
  final DetailPortfolioController dpController =
      Get.put(DetailPortfolioController());
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
                  Obx(() => DetailPortfolioAppBar(
                      isDataLoaded() ? getInvestment().coin_icon : "",
                      isDataLoaded() ? getInvestment().coin_symbol : "",
                      context)),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
                    child: Row(
                      children: [
                        Expanded(flex: 1, child: _buildHoldings()),
                        Expanded(flex: 1, child: _buildAveNetCost()),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 10.0),
                    child: Row(
                      children: [
                        Expanded(flex: 1, child: _buildTotalCost()),
                        Expanded(flex: 1, child: _buildPnL()),
                      ],
                    ),
                  ),
                  _buildTransaction(),
              ],
            )),
          ),
          _buildBottomButton(),
          ],
        ),
    );
  }

  Widget _buildBottomButton() {
    return Container(
      child: Row(
        children: [
          const SizedBox(width: 20),
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: koiColor, textStyle: TxtStyle.button),
              onPressed: () {
                Get.toNamed('/editTransaction', arguments: [
                  {"invId": Get.arguments[0]['investmentId']},
                  {"from": "detail"},
                  {"function": "Add"},
                ]);
              },
              child: Text(
                '+ Add transaction',
                style: TxtStyle.button,
              ),
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

  Widget _buildHoldings() {
    return Container(
      decoration: myBoxDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: topPadding(),
              child: Obx(() => Text(
                  isDataLoaded()
                      ? getInvestment().holdings.toString() +
                          " " +
                          getInvestment().coin_symbol
                      : "",
                  style: TxtStyle.body1))),
          Padding(
              padding: bottomPadding(),
              child: Text(
                "Holdings",
                style: TxtStyle.body2,
              )),
        ],
      ),
    );
  }

  Widget _buildTotalCost() {
    return Container(
      decoration: myBoxDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: topPadding(),
              child: Obx(() => Text(
                  isDataLoaded()
                      ? getInvestment().currency +
                          getInvestment().totalCost.toString()
                      : "",
                  style: TxtStyle.body1))),
          Padding(
              padding: bottomPadding(),
              child: Text("Total Cost", style: TxtStyle.body2)),
        ],
      ),
    );
  }

  Widget _buildAveNetCost() {
    return Container(
      decoration: myBoxDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: topPadding(),
            child: Obx(() => Text(
                isDataLoaded()
                    ? getInvestment().currency +
                        getInvestment().aveNetCost.toString()
                    : "",
                style: TxtStyle.body1)),
          ),
          Padding(
              padding: bottomPadding(),
              child: Text("Average Net Cost", style: TxtStyle.body2)),
        ],
      ),
    );
  }

  Widget _buildPnL() {
    return Container(
      decoration: myBoxDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: topPadding(),
            child: Obx(() => Text(
                isDataLoaded()
                    ? getInvestment().currency + getInvestment().PnL.toString()
                    : "",
                style: TxtStyle.body1)),
          ),
          Padding(
              padding: bottomPadding(),
              child: Text("Profit/Loss", style: TxtStyle.body2)),
        ],
      ),
    );
  }

  Widget _buildTransaction() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 20.0 ),
            child: Text("Transaction History", style: TxtStyle.body1)
        ),
        ElevatedButton(
          child: Text(
            'open',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            Get.bottomSheet(
              customBottom()
            );

          },
        ),
        StreamBuilder<List<SavedTransactionData>>(
            stream: Get.find<DbService>().getStreamTransactions(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final data = snapshot.data!;
                return ListView.separated(
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (_, index) {
                    final item = data[index];
                    return ListTile(
                      title: Text(item.id.toString()),
                    );

                    // return CustomDetailListTile(
                    //   id: item.coin_sid,
                    //   portfolioId: item.id,
                    //   icon: item.coin_icon,
                    //   symbol: item.coin_symbol,
                    //   pnl: item.PnL,
                    //   holdings: item.holdings,
                    //   totalCost: item.totalCost,
                    //   currency: item.currency,
                    // );
                  },
                  separatorBuilder: (_, index) {
                    return Divider();
                  },
                  itemCount: data.length,
                  shrinkWrap: true,
                );
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

  bool isDataLoaded() {
    return dpController.investmentInfo.isNotEmpty;
  }

  SavedInvestmentData getInvestment() {
    return dpController.investmentInfo[0];
  }

//===========UI

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(
        color: Colors.grey[700]!,
      ),
    );
  }

  EdgeInsets topPadding() {
    return const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 3.0);
  }

  EdgeInsets bottomPadding() {
    return const EdgeInsets.fromLTRB(5.0, 3.0, 5.0, 10.0);
  }
}
