import 'package:serangym/models/pra.dart';

class Exercise extends Pra {
  var start = null;
  var end = null;
  var duration = 0; // Millis

  var name = "";
  var sets = <Set>[];

  Exercise(name) {
    this.name = name;
  }

  void addSet(reps) {
    sets.add(new Set(reps));
  }
}

class Set {
  var start = DateTime.now();
  var end = null;
  var reps = "";

  Set(reps) {
    this.reps = reps;
  }
}
