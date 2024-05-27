import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phantom/class/over_train/over_class.dart';

class OverTrainView extends StatefulWidget {
  const OverTrainView({super.key});

  @override
  State<OverTrainView> createState() => _OverTrainViewState();
}

class _OverTrainViewState extends State<OverTrainView> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: h * 0.6,
            width: w,
            decoration: const BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(70),
                bottomRight: Radius.circular(70),
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: h * 0.1,
                ),
                Text(
                  'End of training',
                  style: GoogleFonts.teko(
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: h * 0.04,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: h * 0.1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomOverContainer(
                      h: h,
                      w: w,
                      text: 'number',
                    ),
                    CustomOverContainer(
                      h: h,
                      w: w,
                      text: 'exersize',
                    ),
                    CustomOverContainer(
                      h: h,
                      w: w,
                      text: 'Kkal',
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
