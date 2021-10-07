// ignore_for_file: overridden_fields
import 'package:serangym/Models/exercise.dart';
import 'package:serangym/models/pra.dart';

class Session extends Pra {
  @override
  var table = "sessions";

  DateTime start = DateTime.now();
  DateTime? end;
  List<Exercise> exercises = <Exercise>[];

  @override
  Map<String, dynamic> toFirebase() {
    var firebase = super.toFirebase();
    firebase.addAll({
      'start': start,
      'end': end,
    });
    return firebase;
  }

  @override
  void save(cb, error) {
    end = DateTime.now();
    for (var exer in exercises) {
      exer.save(null, null);
    }
    super.save(cb, error);
  }
}
