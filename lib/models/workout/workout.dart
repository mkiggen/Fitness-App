import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:fitness_app/models/exercise/exercise.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

enum WorkoutType { legs, shoulders, chest, arms, back }

const workoutIconNames = {
  WorkoutType.legs: 'LEGS',
  WorkoutType.shoulders: 'SHOULDERS',
  WorkoutType.chest: 'CHEST',
  WorkoutType.arms: 'ARMS',
  WorkoutType.back: 'BACK',
};

const workoutIcons = {
  WorkoutType.legs: 'assets/images/LEGS-ICON.png',
  WorkoutType.shoulders: 'assets/images/SHOULDERS-ICON.png',
  WorkoutType.chest: 'assets/images/CHEST-ICON.png',
  WorkoutType.arms: 'assets/images/ARMS-ICON.png',
  WorkoutType.back: 'assets/images/BACK-ICON.png',
};

class Workout {
  Workout({
    required this.workoutName,
    required this.exercises,
    required this.date,
    required this.workoutType,
    required this.symbol,
  }) : id = uuid.v4();

  final String id;
  final String workoutName;
  final List<Exercise> exercises;
  final WorkoutType workoutType;
  final DateTime date;
  final Widget symbol;

  String get formattedDate {
    return formatter.format(date);
  }
}
