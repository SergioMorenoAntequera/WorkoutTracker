import 'package:serangym/Models/Model.dart';

class Exercise extends Model {
  var start = DateTime.now();
  var end = DateTime.now();
  var duration = 0; // Millis

  var name = "";
  var sets = [];

  Exercise(name) {
    this.name = name;
  }

  void addSet(reps) {
    sets.add(new Set(reps));
  }
}

class Set {
  var start = DateTime.now();
  var end = DateTime.now();
  var reps = "";
  Set(reps) {
    this.reps = reps;
  }
}
