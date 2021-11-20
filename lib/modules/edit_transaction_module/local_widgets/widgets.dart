
import 'package:coinkoi/core/style/txt_style.dart';
import 'package:flutter/cupertino.dart';

Widget introWidget(String title){
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Text(title, style: TxtStyle.body3),
  );
}