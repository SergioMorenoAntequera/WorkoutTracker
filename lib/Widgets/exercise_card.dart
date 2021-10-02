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
      children: [
        TextButton(
          onPressed: () => {deleteExercise(exercise)},
          child: const Icon(Icons.delete),
        ),
        Text(exercise.name),
        // GridView.count(
        //   // crossAxisCount is the number of columns
        //   crossAxisCount: 2,
        //   // This creates two columns with two items in each column
        //   children: List.generate(2, (index) {
        //     return Center(
        //       child: Text(
        //         'Item $index',
        //       ),
        //     );
        //   }),
        // ),
        ElevatedButton(
            child: const Text("Add Set"),
            onPressed: () => {addSet(exercise, "12")}),
      ],
    );
  }
}
