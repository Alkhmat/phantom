import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RowIconText extends StatelessWidget {
  const RowIconText({super.key, required this.h, required this.w, this.label});

  final double h;
  final double w;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: h * 0.03,
            color: Colors.white,
          ),
        ),
        SizedBox(
          width: w * 0.23,
        ),
        Text(
          label.toString(),
          style: GoogleFonts.teko(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: h * 0.045,
            ),
          ),
        ),
      ],
    );
  }
}
