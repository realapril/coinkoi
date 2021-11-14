

// Future<void> main() async {
//   await initServices(); /// AWAIT SERVICES INITIALIZATION.
//   runApp(SomeApp());
// }
//
// /// Is a smart move to make your Services intiialize before you run the Flutter app.
// /// as you can control the execution flow (maybe you need to load some Theme configuration,
// /// apiKey, language defined by the User... so load SettingService before running ApiService.
// /// so GetMaterialApp() doesnt have to rebuild, and takes the values directly.
// void initServices() async {
//   print('starting services ...');
//   /// Here is where you put get_storage, hive, shared_pref initialization.
//   /// or moor connection, or whatever that's async.
//   await Get.putAsync(() => DbService().init());
//   await Get.putAsync(SettingsService()).init();
//   print('All services started...');
// }

import 'package:coinkoi/data/model/db_model.dart';
import 'package:coinkoi/data/provider/db_provider.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';

// class DbService extends GetxService {
//   var siDao;
//   var getStreamInvestments;
//
//   AppDatabase init() {
//     var db = AppDatabase();
//     siDao = db.savedInvestmentDao;
//     getStreamInvestments = siDao.getStreamInvestments;
//     return db;
//   }
// }

class DbService extends GetxService {
  static DbService get to => Get.find();

  var db = AppDatabase();

  SavedCoinDao getSavedCoinDao(){
    return db.savedCoinDao;
  }

  SavedInvestmentDao getSavedInvestmentDao(){
    return db.savedInvestmentDao;
  }

  Stream<List<SavedInvestmentData>> getStreamInvestments(){
    return db.savedInvestmentDao.streamInvestments();
  }

}
