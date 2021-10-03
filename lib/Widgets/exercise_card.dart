import 'package:flutter/material.dart';
import 'package:serangym/Models/exercise.dart';

class ExerciseCard extends StatelessWidget {
  Exercise exercise;
  Function deleteExercise;
  Function addSet;
  ExerciseCard(this.exercise, this.deleteExercise, this.addSet, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(
          flex: 1,
          child: TextButton(
            onPressed: () => {deleteExercise(exercise)},
            child: const Icon(Icons.delete),
          ),
        ),
        Flexible(
          flex: 2,
          child: Text(exercise.name),
        ),
        Flexible(
          flex: 2,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: exercise.sets.length,
            itemBuilder: (BuildContext context, int index) {
              return Text(exercise.sets[index].reps);
            },
          ),
        ),
        Flexible(
          flex: 2,
          child: ElevatedButton(
              child: const Text("Add Set"),
              onPressed: () => {showAddSetDialog(context, exercise)}),
        ),
      ],
    );
  }

  void showAddSetDialog(context, e) {
    final myController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("How many reps in the set?"),
          content: TextField(
            controller: myController,
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: const Text("Add Set"),
              onPressed: () {
                Navigator.of(context).pop();
                addSet(e, myController.text);
              },
            ),
          ],
        );
      },
    );
  }
}
