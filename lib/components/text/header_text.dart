import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color lightGrey = Color.fromARGB(255, 143, 143, 143);

class ContentText extends StatelessWidget {
  const ContentText({super.key, required this.text});

  final String text;

  @override
  Widget build(context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        letterSpacing: 1,
        color: lightGrey,
        fontSize: 14,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.bold,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }
}

class HeaderText extends StatelessWidget {
  const HeaderText({super.key, required this.text});

  final String text;

  @override
  Widget build(context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        letterSpacing: 1,
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }
}
