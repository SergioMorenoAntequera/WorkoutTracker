import 'package:flutter/material.dart';
import 'package:serangym/Models/exercise.dart';
import 'package:serangym/Models/session.dart';
import 'package:serangym/Views/select_exercise_view.dart';

class SessionView extends StatefulWidget {
  Session? session;
  SessionView(this.session, {Key? key}) : super(key: key);

  @override
  _SessionViewState createState() => _SessionViewState();
}

class _SessionViewState extends State<SessionView> {
  var session = Session();

  @override
  Widget build(BuildContext context) {
    widget.session ??= widget.session = Session();
    session = widget.session!;

    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: session.exercises.length,
        itemBuilder: (BuildContext context, int index) {
          var exercise = session.exercises[index];
          return ListTile(
            leading: const Icon(Icons.list),
            title: Text(exercise.name),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showExerciseList,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showExerciseList() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SelectExerciseView(addExercise)),
    );
  }

  void addExercise(Exercise e) {
    setState(() {
      session.exercises.add(e);
    });
  }
}
