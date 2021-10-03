// ignore_for_file: file_names
import 'package:uuid/uuid.dart';
import 'package:sqflite/sqflite.dart';

abstract class Model {
  String id = const Uuid().v1();
  String table = "";

  dynamic clone() {
    var cloned = this;
    cloned.id = const Uuid().v1();
    return cloned;
  }
}
