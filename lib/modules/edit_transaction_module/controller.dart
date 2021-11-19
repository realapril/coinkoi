import 'package:coinkoi/data/model/model.dart';
import 'package:coinkoi/data/provider/db_provider.dart';
import 'package:coinkoi/data/services/service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class EditTransactionController extends GetxController{
  var coinDao = AppDatabase().savedCoinDao;
  var investmentDao = AppDatabase().savedInvestmentDao;

  // List<Investment> investments = <Investment>[].obs;
  //
  // var coinDao = Get.find<DbService>().db.savedCoinDao;
  // var investmentDao = Get.find<DbService>().db.savedInvestmentDao;
  //
  // void deleteCoin(int coinId){
  //   coinDao.deleteCoin(coinId);
  // }
  // void deletePortfolio(int portfolioId){
  //   investmentDao.deleteInvestment(portfolioId);
  // }

  double ppc = 0.0;
  double quantity = 1;
  RxDouble totalSpent = (0.0).obs;

  void setPPC(String ppc){
    if(ppc.isNotEmpty){
      totalSpent.value = double.parse(ppc)*quantity;
    }
  }
  void setQuantity(String quantity){
    if(quantity.isNotEmpty) {
      totalSpent.value = ppc * double.parse(quantity);
    }
  }

  void validateAndSave(GlobalKey<FormState> formKey) {
    final FormState? form = formKey.currentState;
    if (form!.validate()) {
      print('Form is valid');
    } else {
      print('Form is invalid');
    }
  }
}