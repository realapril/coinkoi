import 'dart:io';

import 'package:coinkoi/data/provider/db_provider.dart';
import 'package:moor/moor.dart';

part 'db_model.g.dart';

class SavedCoin extends Table {
  IntColumn get id => integer()();

  TextColumn get name => text()();

  TextColumn get symbol => text()();

  TextColumn get icon => text()();

  RealColumn get price => real()();

  TextColumn get website => text()();

  TextColumn get twitter => text()();

  TextColumn get technical_doc => text()();

  @override
  Set<Column> get primayKey => {id};
}

class SavedInvestment extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get coin_sid =>
      integer().customConstraint('REFERENCES savedcoin(id)')();

  RealColumn get holdings => real()();

  RealColumn get PnL => real()();

  RealColumn get totalCost => real()();

  RealColumn get aveNetCost => real()();

  @override
  Set<Column> get primayKey => {id};
}

class InvestmentWithCoin {
  InvestmentWithCoin(this.investment_, this.coin_);

  final SavedInvestmentData investment_;
  final SavedCoinData coin_;

  // InvestmentWithCoin(@required this.investment, @required this.coin);

}

enum TransactionType { TYPE_BUY, TYPE_SELL, TYPE_IN, TYPE_OUT }


@UseDao(tables: [SavedInvestment, SavedCoin])
class SavedInvestmentDao extends DatabaseAccessor<AppDatabase> with _$SavedInvestmentDaoMixin {
  SavedInvestmentDao(AppDatabase db) : super(db);

  Stream<List<InvestmentWithCoin>> streamInvestments() =>
      select(savedInvestment)
          // ..orderby()
          .join(
            [
              leftOuterJoin(
                  savedCoin, savedCoin.id.equalsExp(savedInvestment.coin_sid)),
            ],
          )
          .watch()
          .map((rows) =>
            rows.map((row) => (
              InvestmentWithCoin(
                row.readTable(savedInvestment),
                row.readTable(savedCoin),
              )
            )).toList());

  Stream<SavedInvestmentData> streamInvestment(int id) =>
      (select(savedInvestment)..where((tbl) => tbl.id.equals(id)))
          .watchSingle();

  Future insertSavedInvestment(SavedInvestmentCompanion data) =>
      into(savedInvestment).insert(data);
}

@UseDao(tables: [SavedCoin])
class SavedCoinDao extends DatabaseAccessor<AppDatabase>
    with _$SavedCoinDaoMixin {
  SavedCoinDao(AppDatabase db) : super(db);

  Stream<List<SavedCoinData>> streamCoins() => select(savedCoin).watch();

  Stream<SavedCoinData> streamCoin(int id) =>
      (select(savedCoin)..where((tbl) => tbl.id.equals(id))).watchSingle();

  Future insertSavedCoin(SavedCoinCompanion data) =>
      into(savedCoin).insert(data);
}
