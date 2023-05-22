import 'package:fitness_app/models/workout/workout.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/components/text/header_text.dart';

class NewWorkoutIcon extends StatefulWidget {
  const NewWorkoutIcon({
    super.key,
    required this.iconName,
    required this.setIcon,
  });

  final WorkoutType iconName;
  final void Function(WorkoutType icon) setIcon;

  @override
  State<NewWorkoutIcon> createState() {
    return _NewWorkoutIconState();
  }
}

class _NewWorkoutIconState extends State<NewWorkoutIcon> {
  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: const Color.fromARGB(255, 39, 39, 39),
          child: Row(
            children: [
              Image.asset(
                workoutIcons[widget.iconName] as String,
                width: 75,
                height: 75,
              ),
              const Spacer(),
              HeaderText(text: (workoutIconNames[widget.iconName]!)),
              const SizedBox(
                width: 8,
              )
            ],
          ),
        ),
      ),
    );
  }
}
