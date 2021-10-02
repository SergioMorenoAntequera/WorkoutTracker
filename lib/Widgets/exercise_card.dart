import 'package:flutter/material.dart';
import 'package:serangym/Models/exercise.dart';

class ExerciseCard extends StatelessWidget {
  Exercise exercise;
  Function deleteExercise;
  Function addExercise;
  ExerciseCard(this.exercise, this.addExercise, this.deleteExercise, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: TextButton(
        onPressed: () => {deleteExercise(exercise)},
        child: const Icon(Icons.delete),
      ),
      title: Text(exercise.name),
    );
  }
}
