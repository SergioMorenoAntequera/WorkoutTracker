import 'package:flutter/material.dart';
import 'package:serangym/Models/exercise.dart';
import 'package:serangym/Models/session.dart';
import 'package:serangym/Views/select_exercise_view.dart';
import 'package:serangym/Widgets/exercise_card.dart';

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
      appBar: AppBar(
        title: const Text("Nueva Session"),
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: session.exercises.length,
            itemBuilder: (BuildContext context, int index) {
              return ExerciseCard(
                session.exercises[index],
                deleteExercise,
                addSet,
              );
            },
          ),
          Positioned(
            child: ElevatedButton(
              child: const Text('Add Break'),
              onPressed: _addBreak,
            ),
            bottom: 20,
            left: 10,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showExerciseList,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showExerciseList() {
    void addExercise(Exercise e) {
      setState(() {
        session.exercises.add(e);
      });
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SelectExerciseView(addExercise)),
    );
  }

  void _addBreak() {
    setState(() {
      session.exercises.add(Exercise("Break"));
    });
  }

  // methods for the exercise list

  // Methods for exercise card
  void deleteExercise(Exercise e) {
    setState(() {
      var del = session.exercises.firstWhere((element) => element.id == e.id);
      session.exercises.remove(del);
    });
  }

  void addSet(Exercise e, String reps) {
    setState(() {
      e.addSet(reps);
    });
  }
}
