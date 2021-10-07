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
        title: const Text("New Session"),
      ),
      body: Stack(
        children: [
          ReorderableListView.builder(
            onReorder: (int oldIndex, int newIndex) {
              setState(() {
                if (oldIndex < newIndex) {
                  newIndex -= 1;
                }
                final Exercise item = session.exercises.removeAt(oldIndex);
                session.exercises.insert(newIndex, item);
              });
            },
            itemCount: session.exercises.length,
            itemBuilder: (BuildContext context, int index) {
              return ExerciseCard(
                session.exercises[index],
                deleteExercise,
                startExercise,
                finishExercise,
                addSet,
                key: Key('$index'),
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
          ),
          Positioned(
            child: ElevatedButton(
              child: const Text('Finish Session'),
              onPressed: () {
                session.end = DateTime.now();
                session.save(null, null);
              },
            ),
            bottom: 20,
            left: 130,
          ),
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

  void startExercise(Exercise e) {
    setState(() {
      e.start = DateTime.now();
    });
  }

  void finishExercise(Exercise e) {
    setState(() {
      e.end = DateTime.now();
    });
  }
}
