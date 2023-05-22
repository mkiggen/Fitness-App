import 'package:fitness_app/workouts.dart';
import 'package:fitness_app/exercises.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/models/workout/workout.dart';
import 'package:fitness_app/models/exercise/exercise.dart';

final List<Workout> workouts = [];
final List<Exercise> exercises = [];

class Screens extends StatefulWidget {
  const Screens({super.key});

  @override
  State<Screens> createState() {
    return _ScreensState();
  }
}

class _ScreensState extends State<Screens> {
  String currentScreen = 'workout-screen';
  Workout? currentWorkout;

  void _switchScreen(String screen, workout, bool hasWorkout) {
    setState(() {
      currentScreen = screen;
      if (!hasWorkout) return;
      currentWorkout = workout;
      print(currentWorkout as String);
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = Workouts(
      _switchScreen,
      workoutList: workouts,
    );

    if (currentScreen == 'exercise-screen') {
      screenWidget = Exercises(_switchScreen, exerciseList: exercises);
    }

    return screenWidget;
  }
}
