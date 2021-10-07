import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

abstract class Pra {
  var table = "sessions";
  String id = const Uuid().v1();

  dynamic clone() {
    var cloned = this;
    cloned.id = const Uuid().v1();
    return cloned;
  }

  Map<String, dynamic> toFirebase() {
    return {'id': id};
  }

  void save(Function? cb, Function? error) async {
    CollectionReference ref = FirebaseFirestore.instance.collection(table);
    ref.add(toFirebase()).then((value) => cb).catchError((error) => error);
  }

  void get() {
    //FirebaseFirestore.instance.collection('users').doc("asd").get();
  }
}
