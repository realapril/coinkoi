import 'package:coinkoi/data/enums.dart';
import 'package:coinkoi/data/model/model.dart';
import 'package:coinkoi/data/provider/db_provider.dart';
import 'package:coinkoi/data/services/service.dart';
import 'package:get/get.dart';
import 'package:moor/moor.dart' as m;

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

  var coinDao = Get.find<DbService>().db.savedCoinDao;
  var investmentDao = Get.find<DbService>().db.savedInvestmentDao;


  void runFilter(String query) {
    if (query.isEmpty) {
      clearResCoin();
    } else {
      var search = allCoins.where((coin) {
        final nameLower = coin.name.toLowerCase();
        final symbolLower = coin.symbol.toLowerCase();
        final searchLower = query.toLowerCase();
        // return nameLower.contains(searchLower) ||
        //     symbolLower.contains(searchLower);
        return symbolLower.startsWith(searchLower)||
            nameLower.startsWith(searchLower);
      }).toList();
      setResCoin(search);
    }
  }

  void saveCoin(Coin coin){
    coinDao.insertSavedCoin(coin.transferToMoor());
  }

  void saveNewPortfolio(Coin coin){
    investmentDao.insertSavedInvestment(
        SavedInvestmentCompanion(
          coin_sid : m.Value(coin.id),
          coin_symbol : m.Value(coin.symbol),
          coin_icon : m.Value(coin.icon),
          holdings : const m.Value(0.0),
          PnL: const m.Value(0.0),
          totalCost: const m.Value(0.0),
          aveNetCost: const m.Value(0.0),
          currency: const m.Value(CurrencyType.USD),
          transactions : const m.Value(""),
        )

    );
  }

}