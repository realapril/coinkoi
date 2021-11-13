
class Coin{
  int id;
  String name;
  String symbol;
  var icon;
  var price;
  Coin({required this.id, required this.name, required this.symbol, this.icon});

  Coin.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        symbol = json['symbol'],
        icon = 'assets/images/${json['id']}.png';
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
