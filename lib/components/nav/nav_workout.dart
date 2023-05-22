import 'package:flutter/material.dart';
import 'package:fitness_app/components/text/header_text.dart';

class NavWorkout extends StatelessWidget {
  const NavWorkout({super.key, required this.screen, required this.open});

  final void Function() open;
  final String screen;

  @override
  Widget build(context) {
    return SliverAppBar(
      expandedHeight: 150,
      collapsedHeight: 60,
      pinned: true,
      foregroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,

      // Leading Icon
      leading: IconButton(
        onPressed: open,
        icon: const Icon(Icons.add_rounded),
        padding: const EdgeInsets.all(0),
        iconSize: 50,
      ),

      // Title
      flexibleSpace: const FlexibleSpaceBar(
        title: HeaderText(text: 'Michael'),
        centerTitle: true,
      ),

      // Actions
      actions: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.asset(
            'assets/images/MKDesignsCR.png',
            width: 50,
          ),
        ),
        const SizedBox(
          width: 8,
        )
      ],
    );
  }
}
