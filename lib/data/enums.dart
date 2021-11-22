
enum TransactionType {
  Buy, Sell, TransferIn, TransferOut
}

extension TransactionTypeExtension on TransactionType {
  String get stringValues {
    switch (this) {
      case TransactionType.Buy:
        return "Buy";
      case TransactionType.Sell:
        return "Sell";
      case TransactionType.TransferIn:
        return "Transfer in";
      case TransactionType.TransferOut:
        return "Transfer out";
      default:
        return "";
    }
  }

  String get dbValues {
    switch (this) {
      case TransactionType.Buy:
        return "B";
      case TransactionType.Sell:
        return "S";
      case TransactionType.TransferIn:
        return "TI";
      case TransactionType.TransferOut:
        return "TO";
      default:
        return "";
    }
  }
}

