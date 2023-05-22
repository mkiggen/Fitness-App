import 'package:flutter/material.dart';
import 'package:fitness_app/models/exercise/exercise.dart';

class NewExercise extends StatefulWidget {
  const NewExercise({super.key, required this.onSubmitExercise});

  final void Function(Exercise exercise) onSubmitExercise;

  @override
  State<NewExercise> createState() {
    return _NewExerciseState();
  }
}

class _NewExerciseState extends State<NewExercise> {
  @override
  Widget build(context) {
    return const Text('placeholder');
  }
}
