import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomOverContainer extends StatelessWidget {
  const CustomOverContainer({
    super.key,
    required this.h,
    this.text,
    required this.w,
  });

  final double h;
  final String? text;
  final double w;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      height: h * 0.1,
      margin: const EdgeInsets.symmetric(horizontal: 3),
      width: w * 0.3,
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          text.toString(),
          style: GoogleFonts.teko(
            textStyle: TextStyle(color: Colors.white, fontSize: height * 0.035),
          ),
        ),
      ),
    );
  }
}
