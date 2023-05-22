import 'package:fitness_app/components/text/header_text.dart';
import 'package:fitness_app/models/exercise/exercise.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class ExerciseItem extends StatelessWidget {
  const ExerciseItem(this.exercise, this.switchScreen, {super.key});

  final void Function(String screen, dynamic workout, bool hasWorkout) switchScreen;
  final Exercise exercise;

  @override
  Widget build(context) {
    return GestureDetector(
      onTap: () {
        // switchScreen('exercise-screen');
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 12),
        child: ClipRRect(
          child: Container(
            height: 100,
            color: const Color.fromARGB(255, 39, 39, 39),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [HeaderText(text: 'Test')],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
