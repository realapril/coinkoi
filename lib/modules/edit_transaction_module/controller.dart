
import 'package:coinkoi/data/enums.dart';
import 'package:coinkoi/data/provider/db_provider.dart';
import 'package:coinkoi/data/services/service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:moor/moor.dart' as m;


class EditTransactionController extends GetxController{
  var transactionDao = Get.find<DbService>().db.savedTransactionDao;
  var investmentDao = Get.find<DbService>().db.savedInvestmentDao;

  void saveTransaction(){
    print(quantity.toString()+"이거이거이거");
    print(ppc.toString()+"이거이거");

    transactionDao.insertTransaction(
      SavedTransactionCompanion(
          investment_sid : m.Value(investment_sid),
          type : m.Value(type),
          ppc : m.Value(ppc),
          quantity : m.Value(quantity),
          fee : m.Value(0.0), //TODO
          cost : m.Value(totalSpent.value),
          note : m.Value(''),//TODO
          updatedAt : m.Value(currentDateTime),
      )
    );

    //Todo update currency
    //investmentDao.update(table)

  }

  int investment_sid = 0;
  late TransactionType type ;
  Rx<CurrencyType> currency = CurrencyType.USD.obs;
  double ppc = 100.0;
  double quantity = 1;
  RxDouble totalSpent = (100.0).obs;
  RxString currentDateStr = ''.obs;
  late DateTime currentDateTime ;

  void setCurrency(CurrencyType curr){
    currency.value = curr;
  }
  void setPPC(String _ppc){
    if(_ppc.isNotEmpty && isNumeric(_ppc)){
      ppc = double.parse(_ppc);
    }else{
      ppc= 0.0;
    }
    totalSpent.value = ppc * quantity;
    // print(totalSpent.toString());
  }
  void setQuantity(String _quantity){
    if(_quantity.isNotEmpty  && isNumeric(_quantity)) {
      quantity = double.parse(_quantity);
    }else{
      quantity = 0.0;
    }
    totalSpent.value = ppc * quantity;

    // print(totalSpent.toString());
  }


  String setCurrentDate(){
    // var now = DateTime.now();
    // var formatter = DateFormat('yyyy-MM-dd');
    // String formattedDate = formatter.format(now);
    // print(formattedDate);
    currentDateTime= DateTime.now();
    return DateFormat.yMMMEd().format(currentDateTime);
  }

  void setNewDate(DateTime date){
    currentDateTime = date;
    currentDateStr.value = DateFormat.yMMMEd().format(currentDateTime).toString();
  }

  bool isValidate(String? value){
    if(value!=null){
      if(value.isNotEmpty){
        if(isNumeric(value)){
          return true;
        }
      }
    }
    return false;
  }

  bool isNumeric(String? s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  void validateAndSave(GlobalKey<FormState> formKey) {
    final FormState? form = formKey.currentState;
    if (form!.validate()) {
      print('Form is valid');
      saveTransaction();
    } else {
      print('Form is invalid');
    }
  }
}