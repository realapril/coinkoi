import 'package:coinkoi/data/enums.dart';
import 'package:coinkoi/data/provider/db_provider.dart';
import 'package:coinkoi/data/services/service.dart';
import 'package:coinkoi/modules/portfolio_module/controller.dart';
import 'package:coinkoi/modules/portfolio_module/local_widgets/appbar.dart';
import 'package:coinkoi/modules/portfolio_module/local_widgets/custom_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({Key? key}) : super(key: key);

  @override
  _Portfolio createState() => _Portfolio();
}

class _Portfolio extends State<PortfolioScreen> {
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
                  Row(
                    children: [
                      Text('My Portfolio'),
                      Spacer(),
                      const Icon(Icons.blur_off_rounded),
                    ],
                  ),
                  Row(
                    children: [Text('\$'), Text('111')],
                  ),
                  Row(
                    children: [
                      Text('Total Profit/Loss:'),
                      Spacer(), //flex:2
                      Text('\$'),
                      Text('111' + '%'),
                    ],
                  ),
                ],
              ),
            ),
            _buildListViewTop(),
            StreamBuilder<List<SavedInvestmentData>>(
                stream: Get.find<DbService>().getStreamInvestments(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final data = snapshot.data!;

                    return ListView.separated(
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (_, index) {
                        final item = data[index];

                        return CustomListTile(
                          id: item.coin_sid,
                          investmentId: item.id,
                          icon: item.coin_icon,
                          symbol: item.coin_symbol,
                          pnl: item.PnL,
                          holdings: item.holdings,
                          totalCost: item.totalCost,
                          currency: item.currency.symbol,
                        );
                      },
                      separatorBuilder: (_, index) {
                        return const Divider();
                      },
                      itemCount: data.length,
                      shrinkWrap: true,
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  } else {
                    print('portfolio UI Listview : else');
                    return Container();
                  }
                })
        ]),
        )
      ),
    );
  }

  Widget _buildListViewTop() {
    return Center(
      child: Container(
        height: 70,
        decoration: const BoxDecoration(color: Color(0xFF424242)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(flex: 2, child: Text('Coin', textAlign: TextAlign.center)),
            _customVerticalDivider(),
            Expanded(
                flex: 2,
                child: Text(
                  'Profit/Loss',
                  textAlign: TextAlign.center,
                )),
            _customVerticalDivider(),
            Expanded(
                flex: 5,
                child: Text(
                  'Holings',
                  textAlign: TextAlign.center,
                )),
          ],
        ),
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

// Widget testWidget(){
//   RaisedButton(
//     onPressed: (){
//       // Get.toNamed("/detailPortfolio", arguments: {"symbol":"BTC"});
//       Get.toNamed("/detailPortfolio", arguments: Coin( id: 1, name: "Bitcoin", symbol: "BTC"));
//     },
//     child: Text("move to detail protfolio"),)
// }
