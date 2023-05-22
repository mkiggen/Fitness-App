import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewWorkoutTextField extends StatelessWidget {
  const NewWorkoutTextField({super.key, required this.workoutNameController});

  final workoutNameController;

  @override
  Widget build(context) {
    const Color lightGrey = Color.fromARGB(255, 143, 143, 143);

    return TextField(
      autofocus: true,
      cursorColor: Colors.white,
      controller: workoutNameController,
      textAlign: TextAlign.start,
      maxLength: 30,
      style: GoogleFonts.poppins(
        color: Colors.white,
        fontSize: 16,
      ),
      decoration: InputDecoration(
        counterText: '',
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: lightGrey),
        ),
        focusColor: Colors.white,
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        hintText: 'Enter workout name...',
        hintStyle: GoogleFonts.poppins(
          color: lightGrey,
          fontSize: 16,
          letterSpacing: 1,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      ),
    );
  }
}
