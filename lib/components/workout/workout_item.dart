import 'package:fitness_app/components/text/header_text.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/models/workout/workout.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkoutItem extends StatelessWidget {
  const WorkoutItem(this.workout, this.switchScreen, {super.key});

  final void Function(String screen, dynamic workout, bool hasWorkout) switchScreen;
  final Workout workout;

  @override
  Widget build(context) {
    return GestureDetector(
      onTap: () {
        switchScreen('exercise-screen', workout, true);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 12),
        child: ClipRRect(
          child: Container(
            height: 100,
            color: const Color.fromARGB(255, 39, 39, 39),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Image.asset(
                    workoutIcons[workout.workoutType] as String,
                    width: 75,
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      HeaderText(text: workout.workoutName),
                      Text(
                        workout.formattedDate,
                        style: GoogleFonts.poppins(
                          letterSpacing: 4,
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 8,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
