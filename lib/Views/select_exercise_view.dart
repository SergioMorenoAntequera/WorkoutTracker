import 'package:flutter/material.dart';
import 'package:serangym/Models/exercise.dart';

class SelectExerciseView extends StatelessWidget {
  Function addExercise;
  SelectExerciseView(this.addExercise, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var availableExercises = [
      Exercise("1 leg 6 directions"),
      Exercise("Inclined push ups"),
      Exercise("Push ups"),
      Exercise("Bicep curl"),
      Exercise("Sofa back"),
      Exercise("Weight Squats"),
      Exercise("Thursters"),
      Exercise("Lower Abs Dumbell"),
    ];

    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: availableExercises.length,
        itemBuilder: (BuildContext context, int index) {
          var exercise = availableExercises[index];
          return ListTile(
            leading: const Icon(Icons.list),
            title: Text(exercise.name),
            onTap: () => {
              addExercise(availableExercises[index]),
              Navigator.pop(context),
            },
          );
        },
      ),
    );
  }
}
