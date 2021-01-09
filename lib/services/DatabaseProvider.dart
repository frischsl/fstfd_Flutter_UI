import 'dart:async';
import 'dart:io';

import 'package:fast_food/Models/User.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  DatabaseProvider._();

  static final DatabaseProvider db = DatabaseProvider._();
  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await getDatabaseInstance();
    return _database;
  }

  Future<Database> getDatabaseInstance() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "User.db");
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE User ("
          "userID integer primary key AUTOINCREMENT,"
          "email TEXT,"
          "password TEXT,"
          "guid TEXT"
          ")");
    });
  }

  addUserToDatabase(User user) async {
    final db = await database;
    var raw = await db.insert(
      "User",
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return raw;
  }

  updateUser(User user) async {
    final db = await database;
    var response = await db.update("User", user.toMap(),
        where: "id = ?", whereArgs: [user.userID]);
    return response;
  }

  Future<User> getUserWithId(int id) async {
    final db = await database;
    var response = await db.query("User", where: "userID = ?", whereArgs: [id]);
    return response.isNotEmpty ? User.fromMap(response.first) : null;
  }

  Future<List<User>> getAllUsers() async {
    final db = await database;
    var response = await db.query("User");
    List<User> list = response.map((c) => User.fromMap(c)).toList();
    return list;
  }

  deleteUserWithId(int id) async {
    final db = await database;
    return db.delete("User", where: "id = ?", whereArgs: [id]);
  }

  deleteAllUsers() async {
    final db = await database;
    db.delete("User");
  }
}
