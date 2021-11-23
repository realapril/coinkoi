import 'package:coinkoi/modules/btm_navigation.dart';
import 'package:coinkoi/modules/calculator_screen.dart';
import 'package:coinkoi/modules/coin_search_module/screen.dart';
import 'package:coinkoi/modules/currency_seacrh_module/screen.dart';
import 'package:coinkoi/modules/detail_portfolio_module/screen.dart';
import 'package:coinkoi/modules/edit_transaction_module/screen.dart';
import 'package:coinkoi/modules/more_screen.dart';
import 'package:coinkoi/modules/portfolio_module/screen.dart';
import 'package:coinkoi/modules/init_setting_screen.dart';
import 'package:coinkoi/routes/routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.bottomNav, page: ()=> BottomNavigationScreen()),
    GetPage(name: Routes.portfolio, page: ()=> PortfolioScreen(), transitionDuration: Duration.zero,),
    GetPage(name: Routes.detailPortfolio, page: ()=> DetailPortfolioScreen(), transitionDuration: Duration.zero,),
    GetPage(name: Routes.editTransaction, page: ()=> EditTransactionScreen(), transitionDuration: Duration.zero,),
    GetPage(name: Routes.coinSearch, page: ()=> const CoinSearchScreen()),
    GetPage(name: Routes.currencySearch, page: ()=> const CurrencySearchScreen()),
    GetPage(name: Routes.calculator, page: ()=> CalculatorScreen()),
    GetPage(name: Routes.more, page: ()=> MoreScreen()),
    GetPage(name: Routes.initSetting, page: ()=> InitSettingScreen()),
  ];
}
