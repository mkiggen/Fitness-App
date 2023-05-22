import 'package:fitness_app/models/set/set.dart';

class Exercise {
  Exercise({required this.exerciseName, required this.sets});

  final String exerciseName;
  final List<Set> sets;
}
