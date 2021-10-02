import 'package:serangym/Models/Model.dart';
import 'package:serangym/Models/exercise.dart';

class Session extends Model {
  var start = DateTime.now();
  var end = DateTime.now();

  var exercises = [];
}
