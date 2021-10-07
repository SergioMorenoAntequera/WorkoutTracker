// ignore_for_file: overridden_fields
import 'package:serangym/Models/exercise.dart';
import 'package:serangym/models/pra.dart';

class Session extends Pra {
  @override
  var table = "sessions";

  var start = DateTime.now();
  var end = DateTime.now();
  var exercises = <Exercise>[];

  @override
  Map<String, dynamic> toFirebase() {
    var firebase = super.toFirebase();
    firebase.addAll({
      'id': id,
      'start': start,
      'end': end,
    });
    return firebase;
  }
}
