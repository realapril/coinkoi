enum TransactionType { buy, sell, transferIn, transferOut }

extension TransactionTypeExtension on TransactionType {
  String get stringValues {
    switch (this) {
      case TransactionType.buy:
        return "Buy";
      case TransactionType.sell:
        return "Sell";
      case TransactionType.transferIn:
        return "Transfer in";
      case TransactionType.transferOut:
        return "Transfer out";
      default:
        return "";
    }
  }
}

enum CurrencyType {
  USD,
  AED,
  ARS,
  AUD,
  BHD,
  BMD,
  BRL,
  CAD,
  CHF,
  CLP,
  CNY,
  CZK,
  DKK,
  EUR,
  GBP,
  HKD,
  HUF,
  IDR,
  ILS,
  INR,
  JPY,
  KRW,
  KWD,
  LKR,
  MMK,
  MXN,
  MYR,
  NGN,
  NOK,
  NZD,
  PHP,
  PKR,
  PLN,
  RUB,
  SAR,
  SEK,
  SGD,
  THB,
  TRY,
  TWD,
  UAH,
  VEF,
  VND,
  ZAR
}

extension CurrencyTypeExtension on CurrencyType {
  String get symbol {
    switch (this) {
      case CurrencyType.USD:
        return "\$";
      case CurrencyType.AED:
        return "DH";
      case CurrencyType.ARS:
        return "\$";
      case CurrencyType.AUD:
        return "\$";
      case CurrencyType.BHD:
        return "BD";
      case CurrencyType.BMD:
        return "\$";
      case CurrencyType.BRL:
        return "R\$";
      case CurrencyType.CAD:
        return "CA\$";
      case CurrencyType.CHF:
        return "Fr.";
      case CurrencyType.CLP:
        return "CLP\$";
      case CurrencyType.CNY:
        return "¥";
      case CurrencyType.CZK:
        return "Kč";
      case CurrencyType.DKK:
        return "kr.";
      case CurrencyType.EUR:
        return "€";
      case CurrencyType.GBP:
        return "£";
      case CurrencyType.HKD:
        return "HK\$";
      case CurrencyType.HUF:
        return "Ft";
      case CurrencyType.IDR:
        return "Rp";
      case CurrencyType.ILS:
        return "₪";
      case CurrencyType.INR:
        return "₹";
      case CurrencyType.JPY:
        return "¥";
      case CurrencyType.KRW:
        return "₩";
      case CurrencyType.KWD:
        return "KD";
      case CurrencyType.LKR:
        return "RS";
      case CurrencyType.MMK:
        return "K";
      case CurrencyType.MXN:
        return "MX\$";
      case CurrencyType.MYR:
        return "RM";
      case CurrencyType.NGN:
        return "₦";
      case CurrencyType.NOK:
        return "kr";
      case CurrencyType.NZD:
        return "ZN\$";
      case CurrencyType.PHP:
        return "₱";
      case CurrencyType.PKR:
        return "Rs";
      case CurrencyType.PLN:
        return "zł";
      case CurrencyType.RUB:
        return "₽";
      case CurrencyType.SAR:
        return "SR";
      case CurrencyType.SEK:
        return "kr";
      case CurrencyType.SGD:
        return "S\$";
      case CurrencyType.THB:
        return "฿";
      case CurrencyType.TRY:
        return "₺";
      case CurrencyType.TWD:
        return "NT\$";
      case CurrencyType.UAH:
        return "₴";
      case CurrencyType.VEF:
        return "Bs.F";
      case CurrencyType.VND:
        return "₫";
      case CurrencyType.ZAR:
        return "R";

      default:
        return "";
    }
  }

  String get strName {
    switch (this) {
      case CurrencyType.USD:
        return "USD";
      case CurrencyType.AED:
        return "AED";
      case CurrencyType.ARS:
        return "ARS";
      case CurrencyType.AUD:
        return "AUD";
      case CurrencyType.BHD:
        return "BHD";
      case CurrencyType.BMD:
        return "BMD";
      case CurrencyType.BRL:
        return "BRL";
      case CurrencyType.CAD:
        return "CAD";
      case CurrencyType.CHF:
        return "CHF";
      case CurrencyType.CLP:
        return "CLP";
      case CurrencyType.CNY:
        return "CNY";
      case CurrencyType.CZK:
        return "CZK";
      case CurrencyType.DKK:
        return "DKK";
      case CurrencyType.EUR:
        return "EUR";
      case CurrencyType.GBP:
        return "GBP";
      case CurrencyType.HKD:
        return "HKD";
      case CurrencyType.HUF:
        return "HUF";
      case CurrencyType.IDR:
        return "IDR";
      case CurrencyType.ILS:
        return "ILS";
      case CurrencyType.INR:
        return "INR";
      case CurrencyType.JPY:
        return "JPY";
      case CurrencyType.KRW:
        return "KRW";
      case CurrencyType.KWD:
        return "KWD";
      case CurrencyType.LKR:
        return "LKR";
      case CurrencyType.MMK:
        return "MMK";
      case CurrencyType.MXN:
        return "MXN";
      case CurrencyType.MYR:
        return "MYR";
      case CurrencyType.NGN:
        return "NGN";
      case CurrencyType.NOK:
        return "NOK";
      case CurrencyType.NZD:
        return "NZD";
      case CurrencyType.PHP:
        return "PHP";
      case CurrencyType.PKR:
        return "PKR";
      case CurrencyType.PLN:
        return "PLN";
      case CurrencyType.RUB:
        return "RUB";
      case CurrencyType.SAR:
        return "SAR";
      case CurrencyType.SEK:
        return "SEK";
      case CurrencyType.SGD:
        return "SGD";
      case CurrencyType.THB:
        return "THB";
      case CurrencyType.TRY:
        return "TRY";
      case CurrencyType.TWD:
        return "TWD";
      case CurrencyType.UAH:
        return "UAH";
      case CurrencyType.VEF:
        return "VEF";
      case CurrencyType.VND:
        return "VND";
      case CurrencyType.ZAR:
        return "ZAR";

      default:
        return "";
    }
  }
}
