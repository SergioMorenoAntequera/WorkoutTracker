import 'package:uuid/uuid.dart';

abstract class Model {
  String id = Uuid().v1();
}
