import 'dart:io';

import 'package:coinkoi/data/enums.dart';
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

  IntColumn get coin_sid => integer()();

  TextColumn get coin_symbol => text()();

  TextColumn get coin_icon => text()();

  RealColumn get holdings => real()();

  RealColumn get PnL => real()();

  RealColumn get totalCost => real()();

  RealColumn get aveNetCost => real()();

  IntColumn get currency => intEnum<CurrencyType>()();

  TextColumn get transactions => text()();

  DateTimeColumn get updatedAt=> dateTime().withDefault(Constant(DateTime.now()))();


  @override
  Set<Column> get primayKey => {id};
}

class SavedTransaction extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get investment_sid => integer()();

  IntColumn get type => intEnum<TransactionType>()();

  RealColumn get ppc => real()(); //price per coin

  RealColumn get quantity => real()();

  RealColumn get fee => real()();

  RealColumn get cost => real()();

  TextColumn get note => text()();

  DateTimeColumn get updatedAt=> dateTime().withDefault(Constant(DateTime.now()))();

  @override
  Set<Column> get primayKey => {id};
}





@UseDao(tables: [SavedInvestment])
class SavedInvestmentDao extends DatabaseAccessor<AppDatabase> with _$SavedInvestmentDaoMixin {
  SavedInvestmentDao(AppDatabase db) : super(db);

  Stream<List<SavedInvestmentData>> streamInvestments() => select(savedInvestment).watch();

  Stream<SavedInvestmentData> streamInvestment(int id) =>
      (select(savedInvestment)..where((tbl) => tbl.id.equals(id)))
          .watchSingle();

  Future<List<SavedInvestmentData>> getInvestment(int id) =>
      (select(savedInvestment)..where((tbl) => tbl.id.equals(id))).get();


  Future insertSavedInvestment(SavedInvestmentCompanion data) =>
      into(savedInvestment).insert(data);

  Future deleteInvestment(int id) =>
      (delete(savedInvestment)..where((tbl) => tbl.id.equals(id))).go();

  Future updateCurrency(int investmentId, CurrencyType currencyType) {
    // for updates, we use the "companion" version of a generated class. This wraps the
    // fields in a "Value" type which can be set to be absent using "Value.absent()". This
    // allows us to separate between "SET category = NULL" (`category: Value(null)`) and not
    // updating the category at all: `category: Value.absent()`.
    return (update(savedInvestment)
      ..where((t) => t.id.equals(investmentId))
    ).write(SavedInvestmentCompanion(
      currency: Value(currencyType)
    ),
    );
  }
}

@UseDao(tables: [SavedCoin])
class SavedCoinDao extends DatabaseAccessor<AppDatabase> with _$SavedCoinDaoMixin {
  SavedCoinDao(AppDatabase db) : super(db);

  Stream<List<SavedCoinData>> streamCoins() => select(savedCoin).watch();

  Future<List<SavedCoinData>> getCoin(int id) =>
      (select(savedCoin)..where((tbl) => tbl.id.equals(id))).get();

  Future insertSavedCoin(SavedCoinCompanion data) =>
      into(savedCoin).insert(data).catchError((e) {
        print('Got error: $e'); // Finally, callback fires.
      });

  Future deleteCoin(int id) =>
      (delete(savedCoin)..where((tbl) => tbl.id.equals(id))).go();
}

@UseDao(tables: [SavedTransaction])
class SavedTransactionDao extends DatabaseAccessor<AppDatabase> with _$SavedTransactionDaoMixin {
  SavedTransactionDao(AppDatabase db) : super(db);

  Stream<List<SavedTransactionData>> streamTransactions() =>select(savedTransaction).watch();

  Stream<List<SavedTransactionData>> findStreamTransactions(int invId)
  =>(select(savedTransaction)..where((tbl) => tbl.investment_sid.equals(invId))
    ..orderBy(
        [(t) => OrderingTerm(expression: t.updatedAt, mode: OrderingMode.desc)]
      )
    ).watch();

  Future<List<SavedTransactionData>> getTransaction(int id) =>
      (select(savedTransaction)..where((tbl) => tbl.id.equals(id))).get();

  Future insertTransaction(SavedTransactionCompanion data) =>
      into(savedTransaction).insert(data).catchError((e) {
        print('Got error: $e'); // Finally, callback fires.
      });

  Future deleteTransaction(int id) =>
      (delete(savedTransaction)..where((tbl) => tbl.id.equals(id))).go();
}

// @UseDao(tables: [Test])
// class TestDao extends DatabaseAccessor<AppDatabase> with _$TestDaoMixin {
//   TestDao(AppDatabase db) : super(db);
//
//   Future insertSavedCoin(TestCompanion data) =>
//       into(test).insert(data);
// }