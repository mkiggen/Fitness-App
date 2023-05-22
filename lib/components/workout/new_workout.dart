import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fitness_app/components/text/header_text.dart';
import 'package:fitness_app/components/workout/new_workout_icon.dart';
import 'package:fitness_app/components/workout/new_workout_textfield.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/models/workout/workout.dart';
import 'package:google_fonts/google_fonts.dart';

const List<Widget> weightSymbol = [
  Text('KG'),
  Text('LBS'),
];

class NewWorkout extends StatefulWidget {
  const NewWorkout({super.key, required this.onSubmitWorkout});

  final void Function(Workout workout) onSubmitWorkout;

  @override
  State<NewWorkout> createState() {
    return _NewWorkoutState();
  }
}

class _NewWorkoutState extends State<NewWorkout> {
  final _workoutNameController = TextEditingController();
  var _activeWorkoutIcon = WorkoutType.arms;
  Color primaryColor = const Color.fromARGB(255, 39, 39, 39);
  final List<bool> _selectedSymbol = [true, false];
  // final String _symbol = weightSymbol[0] as String;

  void _setActiveIcon(WorkoutType icon) {
    setState(() {
      _activeWorkoutIcon = icon;
    });
  }

  void _submitWorkout() {
    if (_workoutNameController.text.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          backgroundColor: const Color.fromARGB(255, 24, 24, 24),
          titleTextStyle: const TextStyle(color: Colors.white, fontSize: 18),
          contentTextStyle: const TextStyle(color: Colors.white),
          surfaceTintColor: Colors.transparent,
          shadowColor: const Color.fromARGB(120, 24, 24, 24),
          title: const Text('Invalid Input'),
          content: const Text(
            'Please make sure you have entered a valid workout name and selected an icon!',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text(
                'Okay',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      );
      return;
    }

    widget.onSubmitWorkout(
      Workout(
        workoutName: _workoutNameController.text,
        exercises: [],
        date: DateTime.now(),
        workoutType: _activeWorkoutIcon,
        symbol: _selectedSymbol[0] ? weightSymbol[0] : weightSymbol[1],
      ),
    );

    Navigator.pop(context);
  }

  @override
  void dispose() {
    _workoutNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ContentText(text: 'Workout name*'),
          const SizedBox(
            height: 8,
          ),
          Container(
            color: primaryColor,
            child: NewWorkoutTextField(
              workoutNameController: _workoutNameController,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          const ContentText(text: 'Workout icon*'),
          const SizedBox(
            height: 8,
          ),
          Container(
            color: primaryColor,
            height: 90,
            child: DropdownButton2(
              underline: Container(),
              isExpanded: true,
              value: _activeWorkoutIcon,
              enableFeedback: true,

              // Item List
              items: WorkoutType.values
                  .map(
                    (type) => DropdownMenuItem(
                      value: type,
                      child: NewWorkoutIcon(
                        iconName: type,
                        setIcon: _setActiveIcon,
                      ),
                    ),
                  )
                  .toList(),

              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  _setActiveIcon(value);
                });
              },

              // Styling
              buttonStyleData: const ButtonStyleData(
                decoration: BoxDecoration(
                  border: null,
                  boxShadow: null,
                  color: Colors.transparent,
                  backgroundBlendMode: null,
                ),
              ),

              menuItemStyleData: const MenuItemStyleData(
                padding: EdgeInsets.all(0),
                height: 100,
              ),

              dropdownStyleData: DropdownStyleData(
                maxHeight: 200,
                decoration: BoxDecoration(
                  color: primaryColor,
                  boxShadow: const [],
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          const ContentText(text: 'Weight Symbol*'),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Container(
                height: 50,
                width: 100,
                color: primaryColor,
                child: ToggleButtons(
                  direction: Axis.horizontal,

                  // Set State
                  onPressed: (int index) {
                    setState(() {
                      // The button that is tapped is set to true, and the others to false.
                      for (int i = 0; i < _selectedSymbol.length; i++) {
                        _selectedSymbol[i] = i == index;
                      }
                    });
                  },

                  //Styling
                  textStyle: GoogleFonts.poppins(
                    fontSize: 16,
                  ),
                  color: Colors.grey,
                  selectedColor: Colors.white,
                  selectedBorderColor: Colors.transparent,
                  fillColor: const Color.fromARGB(255, 90, 90, 90),
                  isSelected: _selectedSymbol,
                  children: weightSymbol,
                ),
              ),
              const Spacer(),
              Container(
                color: primaryColor,
                height: 50,
                width: 100,
                child: TextButton(
                  onPressed: _submitWorkout,
                  child: Text(
                    'SAVE',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
