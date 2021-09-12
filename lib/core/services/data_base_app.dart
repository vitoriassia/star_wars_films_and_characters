import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:star_wars_films_and_characters/shared/models/favortis_model.dart';

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
    String path = join(directory.path, "appDataBase.db");
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE Moji ("
          "id integer primary key AUTOINCREMENT,"
          "mojiSvg TEXT"
          ")");

      await db.execute("CREATE TABLE Favorit ("
          "id integer primary key,"
          "title TEXT,"
          "subtitle TEXT,"
          "image TEXT,"
          "type TEXT"
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

  addFavoritToDatabase(FavoritsModel favorit) async {
    final db = await database;
    var raw = await db.insert(
      "Favorit",
      favorit.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return raw;
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

  Future<List<FavoritsModel>> getAllFavorit() async {
    final db = await database;
    var response = await db.query("Favorit");
    List<FavoritsModel> list =
        response.map((c) => FavoritsModel.fromMap(c)).toList();
    return list;
  }

  deleteFavoritWithId(int id, String type) async {
    final db = await database;
    return db
        .delete("Favorit", where: "id = ? and type = ?", whereArgs: [id, type]);
  }
}
