import 'package:fitness_app/screens.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const WorkoutApp(),
  );
}

class WorkoutApp extends StatelessWidget {
  const WorkoutApp({super.key});

  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(backgroundColor: Color.fromARGB(255, 24, 24, 24)),
        scaffoldBackgroundColor: const Color.fromARGB(255, 24, 24, 24),
        canvasColor: Colors.transparent,
      ),
      home: const Screens(),
    );
  }
}
