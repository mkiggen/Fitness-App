import 'package:fitness_app/components/nav/nav_exercise.dart';
import 'package:fitness_app/components/nav/nav_workout.dart';
import 'package:fitness_app/models/workout/workout.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/components/workout/new_workout.dart';
import 'package:fitness_app/components/exercise/new_exercise.dart';

class NavBar extends StatefulWidget {
  const NavBar(this.addFunction, this.removeFunction, {super.key, required this.screen, required this.switchScreens});

  final dynamic addFunction, removeFunction;
  final void Function(String screen, dynamic workout, bool hasWorkout) switchScreens;
  final String screen;

  @override
  State<NavBar> createState() {
    return _NavBarState();
  }
}

class _NavBarState extends State<NavBar> {
  void _openAddWorkout() {
    showModalBottomSheet(
      backgroundColor: const Color.fromARGB(255, 24, 24, 24),
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewWorkout(
        onSubmitWorkout: widget.addFunction,
      ),
    );
  }

  void _openAddExercise() {
    showModalBottomSheet(
      backgroundColor: const Color.fromARGB(255, 24, 24, 24),
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExercise(
        onSubmitExercise: widget.addFunction,
      ),
    );
  }

  @override
  Widget build(context) {
    Widget navbar = NavWorkout(
      screen: 'workout-screen',
      open: _openAddWorkout,
    );

    if (widget.screen == 'exercise-screen') {
      navbar = NavExercise(
        screen: 'exercise-screen',
        open: _openAddExercise,
        switchScreens: widget.switchScreens,
      );
    }

    return navbar;
  }
}
