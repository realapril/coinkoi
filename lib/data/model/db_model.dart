import 'dart:io';

import 'package:coinkoi/data/provider/db_provider.dart';
import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

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
}

class SavedInvestment extends Table {
  IntColumn get id => integer().autoIncrement()();
  // Coin coin;
  RealColumn get holdings => real()();
  RealColumn get PnL => real()();
  RealColumn get totalCost => real()();
  RealColumn get aveNetCost => real()();
  // List<Transaction> transactions=[];
}

@UseDao(tables:[SavedInvestment])
class SavedInvestmentDao extends DatabaseAccessor<AppDatabase> with _$SavedInvestmentDaoMixin{
  SavedInvestmentDao(AppDatabase db) : super(db);

  Stream<List<SavedInvestmentData>> streamInvestments() => select(savedInvestment).watch();

  Stream<SavedInvestmentData> streamInvestment(int id) =>
      (select(savedInvestment)..where((tbl) => tbl.id.equals(id))).watchSingle();

  Future insertSavedInvestment(SavedInvestmentCompanion data)
    => into(savedInvestment).insert(data);
}

@UseDao(tables:[SavedCoin])
class SavedCoinDao extends DatabaseAccessor<AppDatabase> with _$SavedCoinDaoMixin{
  SavedCoinDao(AppDatabase db) : super(db);

  Stream<List<SavedCoinData>> streamCoins() => select(savedCoin).watch();

  Stream<SavedCoinData> streamCoin(int id) =>
      (select(savedCoin)..where((tbl) => tbl.id.equals(id))).watchSingle();

  Future insertSavedInvestment(SavedCoinCompanion data)
    => into(savedCoin).insert(data);
}