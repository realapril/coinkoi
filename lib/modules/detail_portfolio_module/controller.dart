import 'package:coinkoi/data/provider/db_provider.dart';
import 'package:coinkoi/data/services/service.dart';
import 'package:get/get.dart';


class DetailPortfolioController extends GetxController{
  var investmentDao = Get.find<DbService>().db.savedInvestmentDao;
  var transactionDao = Get.find<DbService>().db.savedTransactionDao;


  final investmentInfo = <SavedInvestmentData>[].obs;
  final transactionList = <SavedTransactionData>[].obs;

  void getPortfolio(int portfolioId) async {
    investmentInfo.value = await investmentDao.getInvestment(portfolioId);
  }

  void getTransaction(int transactionId) async {
    transactionList.value = await transactionDao.getTransaction(transactionId);
  }


  // var coinDao = Get.find<DbService>().db.savedCoinDao;
  // final coinList = <SavedCoinData>[].obs;
  // void getCoin(int coinId) async {
  //   coinList.value = await coinDao.getCoin(coinId);
  // }
}