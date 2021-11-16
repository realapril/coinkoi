import 'dart:convert';

import 'package:coinkoi/data/model/model.dart';
import 'package:coinkoi/data/provider/db_provider.dart';
import 'package:coinkoi/modules/coin_search_module/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:moor/moor.dart' as m;

class CoinSearchScreen extends StatefulWidget {
  const CoinSearchScreen({Key? key}) : super(key: key);

  @override
  _CoinSearchScreen createState() => new _CoinSearchScreen();
}

class _CoinSearchScreen extends State<CoinSearchScreen> {
  final CoinSearchController csController = Get.put(CoinSearchController());
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    readJson();
  }


  // Fetch content from the json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/jsonfiles/coinmarketcap.json');
    final data = await json.decode(response);

    Map<String, dynamic> myMap = data['data'];
    myMap.forEach((key, value){
      csController.addCoin(Coin.fromJson(value));
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
      ),
      body:SingleChildScrollView(
        child: SafeArea(
          child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: const BoxDecoration(color: Color(0xFF424242)),
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: IconButton(
                              onPressed: (){
                                _controller.clear();
                                csController.runFilter('');
                              },
                              icon: const Icon(Icons.close)
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: TextField(
                            controller: _controller,
                            decoration: const InputDecoration.collapsed(
                                hintText: 'Name or Symbol',
                            ),
                            onChanged: (value) => csController.runFilter(value),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        )
                      ],
                    ),
                  )
                ),
                const SizedBox(
                  height: 10,
                ),
                _buildListView(),
              ],
            )
          ),
      ),
    );
  }

  Widget _buildListView(){
    return Obx(()=> ListView.separated(
      physics: const ClampingScrollPhysics(),
      itemBuilder: (content, index){
        return ListTile(
          title: Text(csController.resCoins[index].name),
          subtitle: Text(csController.resCoins[index].symbol),
          leading: Image(image: AssetImage(csController.resCoins[index].icon)),
          onTap: (){
            //save this coin into portfolio and close this screen
            //save coin
            Coin rCoin = csController.resCoins[index];
            csController.coinDao.insertSavedCoin(rCoin.transferToMoor());
            //save portfolio
            csController.investmentDao.insertSavedInvestment(
              SavedInvestmentCompanion(
                coin_sid : m.Value(rCoin.id),
                holdings : const m.Value(0.0),
                PnL: const m.Value(0.0),
                totalCost: const m.Value(0.0),
                aveNetCost: const m.Value(0.0),
              )
            );

            //close screen
            print(csController.coinDao.streamCoin(1).toString());
            print(csController.investmentDao.streamInvestment(1).toString());

            Get.offAllNamed('/');
          },
        );
      },
      itemCount: csController.resCoins.length,
      separatorBuilder: (_, __) =>const Divider(),
      shrinkWrap: true,
    ));
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    _controller.dispose();
    super.dispose();
  }

}