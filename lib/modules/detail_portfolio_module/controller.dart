import 'package:coinkoi/data/provider/db_provider.dart';
import 'package:coinkoi/data/services/service.dart';
import 'package:get/get.dart';


class DetailPortfolioController extends GetxController{
  var coinDao = Get.find<DbService>().db.savedCoinDao;
  var investmentDao = Get.find<DbService>().db.savedInvestmentDao;


  final transactionList = <SavedInvestmentData>[].obs;
  final coinList = [].obs;


  void getCoin(int coinId) async {
    coinList.add(await coinDao.getCoin(coinId));
  }

  void getPortfolio(int portfolioId) async {
    transactionList.value = await investmentDao.getInvestment(portfolioId);
  }
}