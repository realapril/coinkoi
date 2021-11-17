import 'dart:io';

import 'package:coinkoi/data/model/db_model.dart';
import 'package:moor/moor.dart';
import 'package:moor/ffi.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'db_provider.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db3.sqlite'));
    return VmDatabase(file);
  });
}

@UseMoor(tables: [SavedInvestment, SavedCoin], daos: [SavedInvestmentDao, SavedCoinDao])
class AppDatabase extends _$AppDatabase {
  // AppDatabase(QueryExecutor e) : super(e);
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
      onCreate: (m) async {
        await m.createAll(); // create all tables
      },
      onUpgrade: (migrator, from, to) async {
      },
      beforeOpen: (details) async {
        await customStatement('PRAGMA foreign_keys = ON');
      },
  );
}