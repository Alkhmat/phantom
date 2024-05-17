import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phantom/widgets/string/string-class.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class BodyQuizWidget extends StatefulWidget {
  const BodyQuizWidget({super.key});

  @override
  State<BodyQuizWidget> createState() => _BodyQuizWidgetState();
}

class _BodyQuizWidgetState extends State<BodyQuizWidget> {
  double height = 0.0;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final string = StringClass();

    return Scaffold(
      backgroundColor: Colors.white54,
      body: Row(
        children: [
          Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
                child: SizedBox(
                  height: h * 0.8,
                  width: w * 0.5,
                  child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Container(
                        height: h * 0.375,
                        margin: const EdgeInsets.symmetric(vertical: 3),
                        decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              string.hw[index],
                              style: GoogleFonts.teko(
                                textStyle: TextStyle(
                                    fontSize: h * 0.045, color: Colors.white),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  '50',
                                  style: GoogleFonts.teko(
                                    textStyle: TextStyle(
                                        fontSize: h * 0.080,
                                        color: Colors.white),
                                  ),
                                ),
                                Text(
                                  string.wh[index],
                                  style: GoogleFonts.teko(
                                    textStyle: TextStyle(
                                        fontSize: h * 0.040,
                                        color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  style: IconButton.styleFrom(
                                      backgroundColor: Colors.white60),
                                  icon: Icon(
                                    Icons.add_outlined,
                                    color: Colors.black,
                                    size: h * 0.060,
                                  ),
                                ),
                                SizedBox(
                                  width: w * 0.010,
                                ),
                                IconButton(
                                  style: IconButton.styleFrom(
                                      backgroundColor: Colors.white60),
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.remove_outlined,
                                    color: Colors.black,
                                    size: h * 0.060,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: w * 0.20,
          ),
          SizedBox(
            height: h * 0.8,
            child: SfSlider.vertical(
              value: height,
              min: 0.0,
              max: 220.0,
              inactiveColor: Colors.white70,
              activeColor: Colors.black,
              interval: 10,
              showTicks: true,
              showLabels: true,
              enableTooltip: true,
              showDividers: true,
              onChanged: (dynamic value) {
                setState(() {
                  height = value;
                });
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white60,
        onPressed: () {
          print('flactin buton is working ');
        },
        child: Icon(
          Icons.arrow_forward_ios,
          size: h * 0.030,
        ),
      ),
    );
  }
}
