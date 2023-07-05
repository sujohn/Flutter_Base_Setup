import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbManager {
  
  static const String _table_name = 'tb_expense';
  static const String _database_name = 'db_expense.db';
  static const int _database_version = 1;

  //expense table columns
  static const String title = 'title';
  static const String amount = 'amount';
  static const String date_time = 'date_time';

  late Database _database;

  Future openDb() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), _database_name),
      version: _database_version,
      onCreate: (db, version) async {
        await db.execute('CREATE TABLE $_table_name(id INTEGER PRIMARY KEY autoincrement, $title TEXT, $amount TEXT, $date_time INTEGER)');
      },
    );
    return _database;
  }

  Future insertData(Map<String, dynamic> map) async {
    await openDb();
    return await _database.insert(
      _table_name, 
      map, 
      conflictAlgorithm: ConflictAlgorithm.replace
    );
  }

  Future<List<Map<String, dynamic>>> fetchAllExpense() async {
    await openDb();
    final List<Map<String, dynamic>> maps = await _database.query(_table_name);

    return maps;
  }

  Future<int> updateData(Map<String, dynamic> map) async {
    await openDb();
    return await _database.update(_table_name, map, where: "id == ?", whereArgs: [map['id']]);
  }

  Future<void> deleteData(Map<String, dynamic> map) async {
    await openDb();
    await _database.delete(_table_name, where: "id == ?", whereArgs: [map['id']]);
  }

}