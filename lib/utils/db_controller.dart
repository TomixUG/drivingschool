import 'package:drivingschool/models/question.dart';
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

  Future<void> initDatabase() async {
    WidgetsFlutterBinding.ensureInitialized();
    debugPrint("initilizing DB");

    // create data database
    String dataDbPath = join(await getDatabasesPath(), 'data.db');
    debugPrint(dataDbPath);
    Database dataDb = await openDatabase(
      dataDbPath,
      onCreate: (db, version) async {
        debugPrint("creating dataDb tables...");
        await db.execute('''
          CREATE TABLE user_answers (
            id INTEGER PRIMARY KEY,
            question_id TEXT NOT NULL,
            answer_id TEXT NOT NULL,
            is_correct BOOLEAN NOT NULL,
            FOREIGN KEY (question_id) REFERENCES questions (id),
            FOREIGN KEY (answer_id) REFERENCES answers (id)
          );
          ''');
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
    await _database.rawQuery("ATTACH DATABASE '$dataDbPath' as 'dataDb'");
  }

  Future<List<Question>> getAllQuestions() async {
    final List<Map<String, Object?>> queryResult = await _database.query('questions');
    return queryResult.map((e) => Question.fromMap(e)).toList();
  }

  void test() {
    // _database.rawQuery("SELECT * from dataDb.progress");
    _database.rawQuery(
        "INSERT INTO dataDb.user_answers (question_id, answer_id, is_correct) VALUES ('0606038624', '3057824', 0);");
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
