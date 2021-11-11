import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class PortfolioScreen extends StatefulWidget{
  const PortfolioScreen({Key? key}) : super(key: key);

  @override
  _Portfolio createState()=> _Portfolio();
}

class _Portfolio extends State<PortfolioScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('')),
      body: SafeArea(
        child: new SingleChildScrollView(
            child: new Column(
                children: <Widget>[

                ]
            )
        ),
      ),
    );
  }


  Widget _renderHeaderWidget(String text, TextStyle style){
    return Container(
      height: 50.0,
      color: Colors.blueGrey[400],
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      alignment: Alignment.centerLeft,
      child: Text(text,
        style: style ,
      ),
    );
  }

}

class PortfolioController extends GetxController {
  // final _selectedIndex = 0.obs;
  //
  // get selectedIndex => _selectedIndex.value;
  // set selectedIndex(index) => _selectedIndex.value= index;

}