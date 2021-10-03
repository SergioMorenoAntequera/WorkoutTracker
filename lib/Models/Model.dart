// ignore_for_file: file_names
import 'package:uuid/uuid.dart';
import 'package:sqflite/sqflite.dart';

class Model {
  String id = const Uuid().v1();
  String columnId = "id";

  String table = "";
  static Database? db;
  static String databaseName = "seransgym";
  static var tables = <String>[];
  static void initializeDB(tables) async {
    tables = tables;
    db = await openDatabase(databaseName);
  }

  dynamic clone() {
    var cloned = this;
    cloned.id = const Uuid().v1();
    return cloned;
  }

  Future<Model> save() async {
    print(table);
    var count =
        Sqflite.firstIntValue(await db!.rawQuery('SELECT COUNT(*) FROM Test'));
    assert(count == 2);
    return Model();
  }
  // Future<Session> insert(Session session) async {
  //   session.id = await Model.db!.insert(tableTodo, todo.toMap());
  //   return session;
  // }
}
