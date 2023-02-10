import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';

class DatabaseHelper {
  DatabaseHelper._();

  static DatabaseHelper instance = DatabaseHelper._();

  static final databaseName = 'student.db';
  static final tableName = 'Info';
  static final s_id = 'ID';
  static final s_name = 'Name';
  static final s_email = 'Email';
  static final s_number = 'Number';



  static Database? database;
  Future<Database> get getDatabase async {
    if (database != null) return database!;
    database = await initDatabase();
    return database!;
  }

  initDatabase() async {
    Directory directory = await getApplicationSupportDirectory();
    String path = join(directory.path, databaseName);
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  _onCreate(Database db, int version) {
    db.execute(
      '''create table $tableName(
    $s_id integer primary key,
    $s_name  text not null,
    $s_email integer primary key & text not null  )''',
    );
  }

  Future<int> insertData(Map<String, dynamic> data) async {
    Database db = await instance.getDatabase;
    return await db.insert(tableName, data);
  }

  Future<List<Map<String, dynamic>>> getAllData() async {
    Database db = await instance.getDatabase;
    return await db.query(tableName);
  }

  updateData(data) async {
    Database db = await instance.getDatabase;
    int id = data[s_id];
    return await db
        .update(tableName, data, where: '$s_id = ?', whereArgs: [id]);
  }

  deleteData(int id) async {
    Database db = await instance.getDatabase;
    return await db.delete(tableName, where: '$s_id = ?', whereArgs: [id]);
  }
}



