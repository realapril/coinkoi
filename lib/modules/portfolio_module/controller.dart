import 'package:coinkoi/data/provider/db_provider.dart';
import 'package:coinkoi/data/services/service.dart';
import 'package:get/get.dart';


class PortfolioController extends GetxController{
  // var coinDao = AppDatabase().savedCoinDao;
  // var investmentDao = AppDatabase().savedInvestmentDao;

  // List<Investment> investments = <Investment>[].obs;

  var coinDao = Get.find<DbService>().db.savedCoinDao;
  var investmentDao = Get.find<DbService>().db.savedInvestmentDao;

  void deleteCoin(int coinId){
    coinDao.deleteCoin(coinId);
  }
  void deleteInvestment(int portfolioId){
    investmentDao.deleteInvestment(portfolioId);
  }
}