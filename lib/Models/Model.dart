import 'package:uuid/uuid.dart';

abstract class Model {
  String id = const Uuid().v1();

  dynamic clone() {
    var cloned = this;
    cloned.id = const Uuid().v1();
    return cloned;
  }
}
