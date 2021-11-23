import 'package:coinkoi/data/enums.dart';
import 'package:coinkoi/data/model/model.dart';
import 'package:coinkoi/data/provider/db_provider.dart';
import 'package:coinkoi/data/services/service.dart';
import 'package:get/get.dart';
import 'package:moor/moor.dart' as m;

class CurrencySearchController extends GetxController{

  RxList currencies = [].obs;
  late int idx;

  void getList(CurrencyType init){
    int i =0;
    for (var currency in CurrencyType.values) {
      if(currency.strName ==  init.strName){
        idx = i;
        currencies.add(Currency(isSelected: true, name: currency.strName, symbol: currency.symbol));
      }else{
        currencies.add(Currency(isSelected: false, name: currency.strName, symbol: currency.symbol));
      }
      i++;
    }
  }

  void updateList(int newIdx){
    //unselect old one
    currencies[idx] = Currency(isSelected: false, name: currencies[idx].name, symbol: currencies[idx].symbol);
    //select new one
    currencies[newIdx] = Currency(isSelected: true, name: currencies[newIdx].name, symbol: currencies[newIdx].symbol);
    idx = newIdx;
  }

}
