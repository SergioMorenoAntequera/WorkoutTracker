// ignore_for_file: file_names
import 'package:uuid/uuid.dart';

class Model {
  String id = const Uuid().v1();
  String columnId = "id";

  dynamic clone() {
    var cloned = this;
    cloned.id = const Uuid().v1();
    return cloned;
  }
}
