import 'package:flutter/material.dart';

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
      body: Center(
        child: Text('port'),
      ),
    );
  }

}