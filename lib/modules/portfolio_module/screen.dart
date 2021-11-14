import 'package:coinkoi/data/provider/db_provider.dart';
import 'package:coinkoi/data/services/service.dart';
import 'package:coinkoi/modules/portfolio_module/controller.dart';
import 'package:coinkoi/modules/portfolio_module/local_widgets/appbar.dart';
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
              if(snapshot.hasData){
                final data = snapshot.data!;

                return ListView.separated(
                    itemBuilder: (_, index) {
                      final item = data[index];

                      return ListTile(
                        title: Text(item.aveNetCost.toString()),
                        subtitle: Text(item.holdings.toString()),
                        // tags: item.tags.map((e) => e.name).toList(),
                      );
                    },
                    separatorBuilder: (_, index) {
                      return Divider();
                    },
                    itemCount: data.length,
                  shrinkWrap: true,
                );

              }else{
                return Container();
              }
            }
          )
        ]),
      )),
    );
  }

  Widget _buildListViewTop() {
    return Center(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Container(
              height: 70,
              decoration: const BoxDecoration(color: Color(0xFF424242)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(flex: 2, child: Text('Coin', textAlign: TextAlign.center)),
                  _customVerticalDivider(),
                  Expanded(flex: 3, child: Text('Profit/Loss', textAlign: TextAlign.center,)),
                  _customVerticalDivider(),
                  Expanded(flex: 4, child: Text('Holings', textAlign: TextAlign.center,)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget _buildListView(List<SavedInvestment> data) {
  //   return ListView.separated(
  //         itemBuilder: (content, index) {
  //           return ListTile(
  //             title: Text(pController.investments[index].coin.symbol),
  //             subtitle: Text(pController.investments[index].PnL.toString() +' %'),
  //             leading: Image(image: AssetImage(pController.investments[index].coin.icon)), //holdings, netcost
  //             onTap: () {
  //               // Get.toNamed("/detailPortfolio", arguments: Coin( id: 1, name: "Bitcoin", symbol: "BTC"));
  //             },
  //           );
  //         },
  //         itemCount: data.length,
  //         separatorBuilder: (_, __) => const Divider(),
  //         shrinkWrap: true,
  //       );
  // }

  Widget _customVerticalDivider(){
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
