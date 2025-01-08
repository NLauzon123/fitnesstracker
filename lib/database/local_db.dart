import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/user.dart';

Database? _database;
List wholeDataList = [];

class LocalDatabase {
  Future get database async {
    if (_database != null) return _database;
    _database = await _initializeDB('fitnesstracker.db');
    return _database;
  }
  Future _initializeDB(String filepath) async {
    final dbpath = await getDatabasesPath();
    final path = join(dbpath, filepath);
    return await openDatabase(
      path, 
      version: 1,
      onCreate: _createDB 
    );
  }
  Future _createDB(Database db, int version) async {
    // First create the table
    await db.execute('''
      CREATE TABLE Users(
      id INTEGER PRIMARY KEY, 
      username TEXT NOT NULL, 
      password TEXT NOT NULL,
      age INTEGER NOT NULL,
      height FLOAT NOT NULL,
      weight FLOAT NOT NULL,
      location TEXT NOT NULL)
    ''');
    // Second insert the default users
    List<User> users = [
      User(username: "nicolas", password: "nicolas123", age: 55, height: 1.72, weight: 80, location: "Montreal"),
      User(username: "samir", password: "samir123", age: 50, height: 1.84, weight: 82, location: "Montreal")
    ];
    for (int i = 0; i < users.length; i++) {
      await db.insert(
        "Users", 
        {
          "username": users[i].getUsername(), 
          "password": users[i].getPassword(), 
          "age": users[i].getAge(), 
          "height": users[i].getHeight(),
          "weight": users[i].getWeight(),
          "location": users[i].getLocation()
        }
      );
    }
  }
  Future registerUser({username, password, age, height, weight, location}) async {
    final db = await database;
    await db.insert(
      "Users", 
      {
        "username": username, 
        "password": password, 
        "age": age, 
        "height": height,
        "weight": weight,
        "location": location
      }
    );
    return "User added";
  }
  Future searchByUsername({username}) async {
    final db = await database;
    final searchData = await db.rawQuery('SELECT * FROM Users WHERE username=?', [username]);
    return searchData;
  }
}