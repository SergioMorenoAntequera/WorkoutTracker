import 'package:flutter/material.dart';
import 'package:serangym/Models/exercise.dart';

class ExerciseCard extends StatelessWidget {
  Exercise exercise;
  Function deleteExercise;
  Function startExercise;
  Function finishExercise;
  Function addSet;
  ExerciseCard(this.exercise, this.deleteExercise, this.startExercise,
      this.finishExercise, this.addSet,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                // Trash
                TextButton(
                  onPressed: () => {deleteExercise(exercise)},
                  child: const Icon(Icons.delete),
                ),
                // Name
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(exercise.name),
                    Row(
                      children: [
                        exercise.start != null
                            ? Text(
                                exercise.start.hour.toString() +
                                    ":" +
                                    exercise.start.minute.toString(),
                              )
                            : Container(),
                        exercise.end != null
                            ? Text(
                                " - " +
                                    exercise.end.hour.toString() +
                                    ":" +
                                    exercise.end.minute.toString(),
                              )
                            : Container()
                      ],
                    ),
                  ],
                )
              ],
            ),

            // Add Set and Done
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Row(
                children: [
                  exercise.start == null
                      ? ElevatedButton(
                          child: const Text("Start"),
                          onPressed: () => {startExercise(exercise)},
                        )
                      : exercise.end == null
                          ? ElevatedButton(
                              child: const Text("Done"),
                              onPressed: () => {finishExercise(exercise)},
                            )
                          : Container(),
                  const SizedBox(width: 10),
                  exercise.start != null && exercise.end == null
                      ? Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: ElevatedButton(
                            child: const Text("Add Set"),
                            onPressed: () =>
                                {showAddSetDialog(context, exercise)},
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          ],
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemCount: exercise.sets.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: const EdgeInsets.only(left: 25),
              child: Text(
                "Set " +
                    (index + 1).toString() +
                    ": " +
                    exercise.sets[index].reps,
              ),
            );
          },
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
