import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
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
    debugPrint("initilizing DB");

    // data database
    String dataDbPath = join(await getDatabasesPath(), 'data.db');
    Database dataDb = await openDatabase(
      dataDbPath,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE progress(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
        );
      },
      version: 1,
    );
    await dataDb.close();

    // questions database
    io.Directory applicationDirectory = await getApplicationDocumentsDirectory();
    String questionsDbPath = path.join(applicationDirectory.path, "questions.db");
    // Copy from asset
    ByteData data = await rootBundle.load(path.join("assets/db", "questions.db"));
    List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    // Write and flush the bytes written
    await io.File(questionsDbPath).writeAsBytes(bytes, flush: true);

    _database = await openDatabase(questionsDbPath);

    // attach dataDb
    String absoluteEndPath = join(applicationDirectory.path, "data.db");
    await _database.rawQuery("ATTACH DATABASE '$absoluteEndPath' as 'dataDb'");
  }

  Future<List<Map<String, dynamic>>> getAllQuestions() async {
    return await _database.query('questions');
  }

  void test() {
    _database.rawQuery("SELECT * from dataDb.progress");
  }

  // Future<int> insertUser(Map<String, dynamic> row) async {
  //   return await _database.insert('users', row);
  // }

  // Future<int> updateUser(Map<String, dynamic> row) async {
  //   return await _database.update(
  //     'users',
  //     row,
  //     where: 'id = ?',
  //     whereArgs: [row['id']],
  //   );
  // }

  // Future<int> deleteUser(int id) async {
  //   return await _database.delete(
  //     'users',
  //     where: 'id = ?',
  //     whereArgs: [id],
  //   );
  // }
}
