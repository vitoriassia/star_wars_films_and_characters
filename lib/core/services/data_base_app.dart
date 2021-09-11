import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabaseProvider {
  AppDatabaseProvider._();

  static final AppDatabaseProvider db = AppDatabaseProvider._();
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await getDatabaseInstance();
    return _database!;
  }

  Future<Database> getDatabaseInstance() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "Moji.db");
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE Moji ("
          "id integer primary key AUTOINCREMENT,"
          "mojiSvg TEXT"
          ")");
    });
  }

  addMojiToDatabase(String moji) async {
    final db = await database;
    final verifyExistMoji = await getMojiResponse();
    if (verifyExistMoji.isEmpty) {
      var raw = await db.insert(
        "Moji",
        {"mojiSvg": moji},
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      return raw;
    } else {
      var raw = await updateMoji(verifyExistMoji.first["id"], moji);
      return raw;
    }
  }

  updateMoji(int id, String moji) async {
    final db = await database;
    var response = await db.update("Moji", {"mojiSvg": moji},
        where: "id = ?", whereArgs: [id]);
    return response;
  }

  Future<String> getMoji() async {
    final db = await database;
    var response = await db.query("Moji");
    return response.isEmpty ? '' : response.first["mojiSvg"].toString();
  }

  Future<dynamic> getMojiResponse() async {
    final db = await database;
    var response = await db.query("Moji");
    return response;
  }

  deleteAll() async {
    final db = await database;
    db.delete("Moji");
  }

  // deletePersonWithId(int id) async {
  //   final db = await database;
  //   return db.delete("Person", where: "id = ?", whereArgs: [id]);
  // }

  // Future<String> getPersonWithId(int id) async {
  //   final db = await database;
  //   var response = await db.query("Person", where: "id = ?", whereArgs: [id]);
  //   return response.isNotEmpty ? Person.fromMap(response.first) : null;
  // }

}
