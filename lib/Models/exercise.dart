// ignore: overridden_fields
import 'dart:math';

import 'package:serangym/models/pra.dart';
import 'package:serangym/models/set.dart';

class Exercise extends Pra {
  @override
  String table = "exercises";

  String name = "";
  int duration = 0; // Millis
  DateTime? end;
  DateTime? start;
  List<Set> sets = <Set>[];

  Exercise(this.name);

  @override
  Map<String, dynamic> toFirebase() {
    var firebase = super.toFirebase();
    firebase.addAll({
      'name': name,
      'start': start,
      'end': end,
      'duration': duration,
    });
    return firebase;
  }

  void addSet(reps) {
    sets.add(Set(reps));
  }

  @override
  void save(cb, error) {
    end = DateTime.now();
    if (start != null && end != null) {
      duration = start!.millisecond - end!.millisecond;
    }
    super.save(cb, error);
  }
}
