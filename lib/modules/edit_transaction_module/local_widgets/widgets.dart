
import 'package:coinkoi/core/style/txt_style.dart';
import 'package:flutter/cupertino.dart';

Widget introWidget(String title, bool isMust){
  if(isMust){
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(text: title, style: TxtStyle.body3),
              TextSpan(text: ' *', style: TxtStyle.body8),
            ],
          ),
        )
    );
  }else{
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(title, style: TxtStyle.body3),
    );

  }
}