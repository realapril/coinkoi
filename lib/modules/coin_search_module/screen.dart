import 'package:coinkoi/modules/coin_search_module/local_widgets/listview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoinSearchScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
      ),
      body:SafeArea(
        child: Column(
            children: [
              Container(
                decoration: BoxDecoration(color: Colors.red),
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(Icons.close),
                      ),
                      SearchList()
                    ],
                  ),
                )
              )
            ],
          )
        ),

    );
  }
}