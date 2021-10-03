// ignore_for_file: overridden_fields

import 'package:serangym/Models/model.dart';
import 'package:serangym/Models/exercise.dart';
import 'package:sqflite/sqflite.dart';

class Session extends Model {
  var start = DateTime.now();
  var end = DateTime.now();

  @override
  var table = "sessions";

  var exercises = <Exercise>[];

  void test() async {
    var databasesPath = await getDatabasesPath();

    // Database database = await openDatabase(path, version: 1,
    //     onCreate: (Database db, int version) async {
    //   // When creating the db, create the table
    //   await db.execute(
    //       'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)');
    // });
  }
}
