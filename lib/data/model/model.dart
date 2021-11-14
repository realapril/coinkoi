
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

}

//one coin investment in a Portfolio
class Investment{
  int id;
  Coin coin;
  int holdings;
  int PnL;
  int totalCost;
  int aveNetCost;
  List<Transaction> transactions=[];

  Investment({required this.id, required this.coin, required this.holdings, required this.PnL, required this.totalCost, required this.aveNetCost});
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
