import 'dart:convert';

import 'file:///C:/Users/samfr/AndroidStudioProjects/fstfd/lib/components/Main/RecipeCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fast_food/Models/ComplexSearchWithRecipeInformationNutrition.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../constants.dart';

class testing_grounds extends StatefulWidget {
  const testing_grounds({Key key}) : super(key: key);
  @override
  _testing_groundsState createState() => _testing_groundsState();
}

class _testing_groundsState extends State<testing_grounds> {
  Future<dynamic> test;
  Future<Database> database;

  @override
  void initState() {
    super.initState();
    // test = testLocalAPI();
    // CreateUsersTable();
    User user = new User(2, "email", "password", "guid-guid-guid");
    CallInsertUser(user);
  }

  void CallInsertUser(user) async {
    await insertUser(user);
  }

  void CreateUsersTable() async {
    print("In CreateUsersTable: ");
    WidgetsFlutterBinding.ensureInitialized();
    database = openDatabase(
      join(await getDatabasesPath(), 'user_database.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE Users(userID INTEGER PRIMARY KEY, email TEXT, password TEXT, guid TEXT)",
        );
      },
      version: 1,
    );
  }

  Future<void> insertUser(User user) async {
    // Get a reference to the database.
    await CreateUsersTable();
    final Database db = await database;

    await db.insert(
      'Users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    print("After the insert...");
    print(await users());

    List<User> us = await users();
    us.forEach((element) {
      print(element.email);
    });
  }

  Future<List<User>> users() async {
    final Database db = await database;

    // Query the table for all The Users.
    final List<Map<String, dynamic>> maps =
        await db.query('Users', where: 'userID = 1');

    return List.generate(maps.length, (i) {
      return User(
        maps[i]['userID'],
        maps[i]['email'],
        maps[i]['password'],
        maps[i]['guid'],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: 100.0,
          height: 100.0,
          color: Colors.green,
        ),
      ),
    );
  }
}

class User {
  final int userID;
  final String email;
  final String password;
  final String guid;

  User(this.userID, this.email, this.password, this.guid);

  Map<String, dynamic> toMap() {
    return {
      'userID': userID,
      'email': email,
      'password': password,
      'guid': guid,
    };
  }
}
