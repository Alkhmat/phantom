import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phantom/data/cubits/bmi/bmi_cubit.dart';
import 'package:phantom/widgets/string/string-class.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class BodyQuizWidget extends StatefulWidget {
  const BodyQuizWidget({super.key});

  @override
  State<BodyQuizWidget> createState() => _BodyQuizWidgetState();
}

class _BodyQuizWidgetState extends State<BodyQuizWidget> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final string = StringClass();
    double height = 150;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black54,
        body: Row(
          children: [
            Column(
              children: [
                SizedBox(
                  height: h * 0.070,
                ),
                SizedBox(
                  width: w * 0.6,
                  height: h * 0.8,
                  child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return BlocBuilder<BodyQuizCubit, Map<int, int>>(
                        builder: (context, state) {
                          return Container(
                            height: h * 0.395,
                            width: w * 0.55,
                            decoration: BoxDecoration(
                              color: Colors.white24,
                              borderRadius: BorderRadius.circular(80),
                            ),
                            margin: const EdgeInsets.symmetric(
                                vertical: 2, horizontal: 5),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: h * 0.040,
                                ),
                                Text(
                                  string.hw[index],
                                  style: GoogleFonts.teko(
                                    textStyle: TextStyle(
                                        color: Colors.white60,
                                        fontSize: h * 0.050),
                                  ),
                                ),
                                SizedBox(
                                  height: h * 0.020,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  textBaseline: TextBaseline.alphabetic,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.baseline,
                                  children: [
                                    Text(
                                      state[index]!.toString(),
                                      style: GoogleFonts.teko(
                                        textStyle: TextStyle(
                                            color: Colors.white54,
                                            fontSize: h * 0.070),
                                      ),
                                    ),
                                    Text(
                                      string.wh[index],
                                      style: GoogleFonts.teko(
                                          textStyle: TextStyle(
                                              color: Colors.white54,
                                              fontSize: h * 0.030)),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: h * 0.020,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        BlocProvider.of<BodyQuizCubit>(context)
                                            .increment(index);
                                      },
                                      style: IconButton.styleFrom(
                                          backgroundColor: Colors.white54),
                                      icon: Icon(
                                        Icons.add_outlined,
                                        color: Colors.black87,
                                        size: h * 0.06,
                                      ),
                                    ),
                                    SizedBox(
                                      width: w * 0.030,
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        BlocProvider.of<BodyQuizCubit>(context)
                                            .decrement(index);
                                      },
                                      style: IconButton.styleFrom(
                                          backgroundColor: Colors.white54),
                                      icon: Icon(
                                        Icons.remove_outlined,
                                        color: Colors.black87,
                                        size: h * 0.060,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            Expanded(
              child: SfSlider.vertical(
                value: height.toInt(),
                min: 0.0,
                max: 220.0,
                showTicks: true,
                showLabels: true,
                enableTooltip: true,
                onChanged: (value) {
                  setState(() {
                    height = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
