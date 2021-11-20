
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class EditTransactionController extends GetxController{
  // var coinDao = AppDatabase().savedCoinDao;
  // var investmentDao = AppDatabase().savedInvestmentDao;

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

  String currency = 'USD';
  double ppc = 100.0;
  double quantity = 1;
  RxDouble totalSpent = (100.0).obs;

  void setCurrency(String curr){
    currency = curr;
  }
  void setPPC(String _ppc){
    if(_ppc.isNotEmpty){
      totalSpent.value = double.parse(_ppc)*quantity;
    }else{
      ppc= 0.0;
    }
    print(totalSpent.toString());
  }
  void setQuantity(String _quantity){
    if(_quantity.isNotEmpty) {
      totalSpent.value = ppc * double.parse(_quantity);
    }else{
      quantity = 0.0;
    }
    print(totalSpent.toString());

  }

  void validateAndSave(GlobalKey<FormState> formKey) {
    final FormState? form = formKey.currentState;
    if (form!.validate()) {
      print('Form is valid');
    } else {
      print('Form is invalid');
    }
  }

  // String getCurrentDate(){
  //   var now = DateTime.now();
  //   var formatter = DateFormat('yyyy-MM-dd');
  //   String formattedDate = formatter.format(now);
  //   print(formattedDate);
  //   return formattedDate;
  // }
}