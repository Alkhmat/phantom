import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContaiterTap extends StatelessWidget {
  const ContaiterTap(
      {super.key, required this.h, required this.w, required this.label});

  final double h;
  final double w;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.symmetric(vertical: 5),
      height: h * 0.065,
      width: w * 0.7,
      child: Center(
        child: Text(
          label,
          style: GoogleFonts.teko(
            textStyle: TextStyle(
              color: Colors.black,
              fontSize: h * 0.045,
            ),
          ),
        ),
      ),
    );
  }
}
