import 'package:fitness_app/components/workout/workout_item.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/models/workout/workout.dart';
import 'package:fitness_app/components/nav/navbar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Workouts extends StatefulWidget {
  const Workouts(this.switchScreens, {super.key, required this.workoutList});

  final void Function(String screen, dynamic workout, bool hasWorkout) switchScreens;
  final List<Workout> workoutList;

  @override
  State<Workouts> createState() {
    return _WorkoutsState();
  }
}

class _WorkoutsState extends State<Workouts> {
  void _addWorkout(Workout workout) {
    setState(() {
      widget.workoutList.insert(0, workout);
    });
  }

  void _removeWorkout(Workout workout) {
    setState(() {
      widget.workoutList.remove(workout);
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
              _addWorkout,
              _removeWorkout,
              screen: 'workout-screen',
              switchScreens: widget.switchScreens,
            ),

            // Body
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (ctx, index) => Slidable(
                  key: ValueKey(widget.workoutList[index]),
                  endActionPane: ActionPane(
                    motion: const StretchMotion(),
                    // dismissible: DismissiblePane(
                    //   onDismissed: () {
                    //     _removeWorkout(_loggedWorkouts[index]);
                    //   },
                    // ),

                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Container(
                            alignment: Alignment.center,
                            color: Colors.redAccent,
                            child: IconButton(
                              alignment: Alignment.topCenter,
                              onPressed: () {
                                _removeWorkout(widget.workoutList[index]);
                              },
                              icon: const Icon(Icons.delete),
                              iconSize: 35,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  child: WorkoutItem(
                    widget.workoutList[index],
                    widget.switchScreens,
                  ),
                ),
                childCount: widget.workoutList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
