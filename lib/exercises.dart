// import 'package:fitness_app/components/exercise/new_exercise.dart';
import 'package:fitness_app/components/exercise/exercise_item.dart';
import 'package:fitness_app/models/exercise/exercise.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/components/nav/navbar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Exercises extends StatefulWidget {
  const Exercises(this.switchScreens, {super.key, required this.exerciseList});

  final void Function(String screen, dynamic workout, bool hasWorkout) switchScreens;
  final List<Exercise> exerciseList;

  @override
  State<Exercises> createState() {
    return _ExercisesState();
  }
}

class _ExercisesState extends State<Exercises> {
  void _addExercise(Exercise exercise) {
    setState(() {
      widget.exerciseList.insert(0, exercise);
    });
  }

  void _removeExercise(Exercise exercise) {
    setState(() {
      widget.exerciseList.remove(exercise);
    });
  }

  @override
  Widget build(context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(
          slivers: [
            // App Bar
            NavBar(
              _addExercise,
              _removeExercise,
              screen: 'exercise-screen',
              switchScreens: widget.switchScreens,
            ),

            // Body
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (ctx, index) => Slidable(
                  key: ValueKey(widget.exerciseList[index]),
                  endActionPane: const ActionPane(
                    motion: StretchMotion(),
                    children: [],
                  ),
                  child: ExerciseItem(widget.exerciseList[index], widget.switchScreens),
                ),
                childCount: widget.exerciseList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
