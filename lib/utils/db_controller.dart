import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'dart:io' as io;

class DbController extends GetxController {
  late Database _database;

  @override
  void onInit() {
    super.onInit();
    initDatabase();
  }

  Future<void> initDatabase() async {
    WidgetsFlutterBinding.ensureInitialized();

    // debugPrint("initilizing DB");
    // _database = await openDatabase(
    //   join(await getDatabasesPath(), 'myDb.db'),
    //   onCreate: (db, version) {
    //     return db.execute(
    //       'CREATE TABLE users(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
    //     );
    //   },
    //   version: 1,
    // );

    io.Directory applicationDirectory = await getApplicationDocumentsDirectory();
    String dbPath = path.join(applicationDirectory.path, "questions.db");

    // bool dbExists = await io.File(dbPath).exists();
    // if (!dbExists) {
    // Copy from asset
    ByteData data = await rootBundle.load(path.join("assets/db", "questions.db"));
    List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

    // Write and flush the bytes written
    await io.File(dbPath).writeAsBytes(bytes, flush: true);
    // }

    _database = await openDatabase(dbPath);
  }

  Future<int> insertUser(Map<String, dynamic> row) async {
    return await _database.insert('users', row);
  }

  Future<List<Map<String, dynamic>>> queryAll() async {
    return await _database.query('categories');
  }

  Future<int> updateUser(Map<String, dynamic> row) async {
    return await _database.update(
      'users',
      row,
      where: 'id = ?',
      whereArgs: [row['id']],
    );
  }

  Future<int> deleteUser(int id) async {
    return await _database.delete(
      'users',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
