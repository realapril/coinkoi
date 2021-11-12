import 'dart:convert';

import 'package:coinkoi/data/model/model.dart';
import 'package:coinkoi/modules/coin_search_module/local_widgets/listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CoinSearchScreen extends StatefulWidget {
  const CoinSearchScreen({Key? key}) : super(key: key);

  @override
  _CoinSearchScreen createState() => new _CoinSearchScreen();
}

class _CoinSearchScreen extends State<CoinSearchScreen> {
  @override
  void initState() {
    super.initState();
    readJson();
  }
  List<Coin> _coins=[];
  List<Coin> _resultCoins=[];


  // Fetch content from the json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/jsonfiles/coinmarketcap.json');
    final data = await json.decode(response);


    Map<String, dynamic> myMap = data['data'];
    myMap.forEach((key, value){
      _coins.add(Coin.fromJson(value));
    });

    // print(_coins[0]);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
      ),
      body:SafeArea(
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
                              //TODO
                            },
                            icon: const Icon(Icons.close)
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: TextField(
                          decoration: const InputDecoration.collapsed(
                              hintText: 'Name or Symbol'
                          ),
                          onChanged: (value) => _runFilter(value),
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

    );
  }

  Widget _buildListView(){
    return Obx(()=> ListView.separated(
      itemBuilder: (_, index){
        return ListTile(
          title: Text(""),
          subtitle: Text(""),
          leading: Icon(Icons.watch),
        );
      },
      itemCount: 3,
      separatorBuilder: (BuildContext context, int index) =>const Divider(),
    ));
  }

  void _runFilter(String query) {

    if (query.isEmpty) {
      _resultCoins = _coins;
    } else {
      final coins = _coins.where((coin) {
        final nameLower = coin.name.toLowerCase();
        final symbolLower = coin.symbol.toLowerCase();
        final searchLower = query.toLowerCase();

        return nameLower.contains(searchLower) ||
          symbolLower.contains(searchLower);
      }).toList();

      // setState(() {
      //   // _foundUsers = results;
      //   // results = coins;
      //   print(coins);
      // }
      // );
    }
  }

}