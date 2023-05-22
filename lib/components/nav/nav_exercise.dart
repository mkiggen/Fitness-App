import 'package:flutter/material.dart';
import 'package:fitness_app/components/text/header_text.dart';
import 'package:fitness_app/models/workout/workout.dart';

class NavExercise extends StatelessWidget {
  const NavExercise({super.key, required this.screen, required this.open, required this.switchScreens});

  final void Function() open;
  final String screen;
  final void Function(String screen, dynamic workout, bool hasWorkout) switchScreens;
  final bool hasWorkout = false;

  @override
  Widget build(context) {
    return SliverAppBar(
      expandedHeight: 60,
      collapsedHeight: 60,
      pinned: true,
      foregroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,

      // Leading Icon
      leading: IconButton(
        onPressed: () => switchScreens('workout-screen', '', hasWorkout),
        icon: const Icon(Icons.chevron_left),
        padding: const EdgeInsets.all(0),
        iconSize: 50,
      ),

      // Title
      flexibleSpace: const FlexibleSpaceBar(
        title: HeaderText(text: ''),
        centerTitle: true,
      ),

      // Actions
      actions: [
        IconButton(
          onPressed: open,
          icon: const Icon(Icons.add_rounded),
          padding: const EdgeInsets.all(0),
          iconSize: 50,
        ),
        const SizedBox(
          width: 8,
        )
      ],
    );
  }
}
