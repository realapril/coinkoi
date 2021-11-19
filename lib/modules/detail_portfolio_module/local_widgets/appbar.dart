import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget DetailPortfolioAppBar(String coinIcon, String coinSymbol, BuildContext context){
  var height = MediaQuery.of(context).padding.top;

  print(height.toString());
  print(height.toString());
  print(height.toString());


  return Container(
    decoration: BoxDecoration(
      color: Colors.grey[700],
    ),
    height: height+60,
    child: Column(
      children: [
      SizedBox(height: height,),
      Expanded(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 15,),
            _backButton(),
            const SizedBox(width: 15,),
            coinIcon.isNotEmpty? Image(image: AssetImage(coinIcon)): const SizedBox(),
            const SizedBox(width: 15,),
            Text(coinSymbol , style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),

            ],
          ),
        )
      ],
    )
  );
}

Widget _backButton(){
  return GestureDetector(
      child: const Icon(Icons.arrow_back , size: 25.0),
      onTap: () {
        Get.offAllNamed('/');
      },
  );

}