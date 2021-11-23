import 'dart:convert';

import 'package:coinkoi/data/enums.dart';
import 'package:coinkoi/modules/currency_seacrh_module/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moor/moor.dart' as m;

class CurrencySearchScreen extends StatefulWidget {
  const CurrencySearchScreen({Key? key}) : super(key: key);

  @override
  _CurrencySearchScreen createState() => new _CurrencySearchScreen();
}

class _CurrencySearchScreen extends State<CurrencySearchScreen> {
  final CurrencySearchController csController = Get.put(CurrencySearchController());
  late CurrencyType currentC;

  // final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    currentC = Get.arguments[0]['currency'];
    csController.getList(currentC);
    print(currentC);
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Currency"),
      ),
      body:SingleChildScrollView(
        child: SafeArea(
          child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                // Container(
                //   decoration: const BoxDecoration(color: Color(0xFF424242)),
                //   child: Padding(
                //       padding: const EdgeInsets.all(10.0),
                //       child: Row(
                //       children: [
                //         Padding(
                //           padding: const EdgeInsets.all(10.0),
                //           child: IconButton(
                //               onPressed: (){
                //                 _controller.clear();
                //               },
                //               icon: const Icon(Icons.close)
                //           ),
                //         ),
                //         const SizedBox(
                //           width: 8,
                //         ),
                //         Expanded(
                //           child: TextField(
                //             controller: _controller,
                //             decoration: const InputDecoration.collapsed(
                //                 hintText: 'Search',
                //             ),
                //             // onChanged: (value) => csController.runFilter(value),
                //           ),
                //         ),
                //         const SizedBox(
                //           width: 20,
                //         )
                //       ],
                //     ),
                //   )
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
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
          title: Text(csController.currencies[index].name),
          subtitle: Text(csController.currencies[index].symbol),
          leading: csController.currencies[index].isSelected? const Icon(Icons.check) : const SizedBox(width: 10,),
          onTap: (){
            //save this currency and close this screen
            //save coin
            // Coin rCoin = csController.resCoins[index];
            // csController.saveCoin(rCoin);
            // //save portfolio
            // csController.saveNewPortfolio(rCoin);
            csController.updateList(index);
            //close screen
            // Get.offAllNamed('/');
          },
        );
      },
      itemCount: csController.currencies.length,
      separatorBuilder: (_, __) =>const Divider(),
      shrinkWrap: true,
    ));
  }
  //
  // @override
  // void dispose() {
  //   // Clean up the controller when the widget is removed from the
  //   // widget tree.
  //   _controller.dispose();
  //   super.dispose();
  // }

}