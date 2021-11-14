
import 'package:coinkoi/data/provider/db_provider.dart';
import 'package:moor/moor.dart';
class Coin{
  int id;
  String name;
  String symbol;
  var icon;
  var price;
  String website;
  String twitter;
  String technical_doc;

  Coin({required this.id, required this.name, required this.symbol, this.icon, required this.website, required this.twitter, required this.technical_doc,});

  Coin.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        symbol = json['symbol'],
        icon = 'assets/images/${json['id']}.png',
        website = json['urls']['website'].isEmpty? '' : json['urls']['website'][0],
        twitter = json['urls']['twitter'].isEmpty? '' : json['urls']['twitter'][0] ,
        technical_doc = json['urls']['technical_doc'].isEmpty? '' : json['urls']['technical_doc'][0] ;

  SavedCoinCompanion transferToMoor(){
    return SavedCoinCompanion(
      id : Value(id),
      name : Value(name),
      symbol: Value(symbol),
      icon: Value(icon),
      price: const Value(0), //TODO this function will be updated later
      website: Value(website),
      twitter: Value(twitter),
      technical_doc: Value(technical_doc)
    );
  }
}

//one coin investment in a Portfolio
class Investment{
  int id;
  Coin coin;
  double holdings;
  double PnL;
  double totalCost;
  double aveNetCost;
  List<Transaction> transactions=[];

  Investment({required this.id, required this.coin, required this.holdings, required this.PnL, required this.totalCost, required this.aveNetCost});

  // SavedInvestmentCompanion transferToMoor(){
  //   return SavedInvestmentCompanion(
  //     coin_sid : Value(coin.id),
  //     holdings : Value(holdings),
  //     PnL: Value(PnL),
  //     totalCost: Value(totalCost),
  //     aveNetCost: Value(aveNetCost),
  //   );
  // }
}

class Portfolio{
  int id;
  double earnings;
  double PnL;
  List<Investment> investments=[];

  Portfolio({required this.id, required this.earnings, required this.PnL});
}


class Currency{
  int id;
  String name;
  String symbol;
  var icon;

  Currency({required this.id, required this.name, required this.symbol, this.icon});
}

class Transaction{
  var type;
  var date;
  var pricePerCoin;
  var Quantity;
  var fee;
  var cost;
  var note;
}
