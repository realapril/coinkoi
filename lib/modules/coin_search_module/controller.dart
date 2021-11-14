import 'package:coinkoi/data/model/model.dart';
import 'package:coinkoi/data/provider/db_provider.dart';
import 'package:get/get.dart';

class CoinSearchController extends GetxController{

  List<Coin> allCoins = <Coin>[];
  addCoin(Coin coin) => allCoins.add(coin);

  List<Coin> resCoins = <Coin>[].obs;

  setResCoin(List<Coin> filteredList) {
    resCoins.clear();
    resCoins.addAll(filteredList);
  }
  clearResCoin(){
    resCoins.clear();
  }

  var coinDao = AppDatabase().savedCoinDao;
  var investmentDao = AppDatabase().savedInvestmentDao;

  void runFilter(String query) {
    if (query.isEmpty) {
      clearResCoin();
    } else {
      var search = allCoins.where((coin) {
        final nameLower = coin.name.toLowerCase();
        final symbolLower = coin.symbol.toLowerCase();
        final searchLower = query.toLowerCase();
        return nameLower.contains(searchLower) ||
            symbolLower.contains(searchLower);
      }).toList();
      setResCoin(search);
    }
  }

}