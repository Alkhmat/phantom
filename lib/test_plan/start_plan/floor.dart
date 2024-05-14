import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phantom/class/app_text/app_text_class.dart';
import 'package:phantom/test_plan/start_plan/user_goals.dart';
import 'package:phantom/widgets/string/string-class.dart';

class FloorPage extends StatefulWidget {
  const FloorPage({super.key});

  @override
  State<FloorPage> createState() => _FloorPageState();
}

class _FloorPageState extends State<FloorPage> {
  int? choiseIndex;
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final string = StringClass();
    final w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: h * 0.050,
              ),
              Text(
                'Select gender',
                style: GoogleFonts.teko(
                  textStyle:
                      TextStyle(color: Colors.white70, fontSize: h * 0.060),
                ),
              ),
              SizedBox(
                height: h * 0.05,
              ),
              SizedBox(
                height: h * 0.63,
                width: w,
                child: ListView.builder(
                  itemCount: 2,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          choiseIndex = index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 270),
                        height: h * 0.6,
                        width: choiseIndex == index ? w * 0.48 : w * 0.466,
                        decoration: BoxDecoration(
                            borderRadius: choiseIndex == index
                                ? BorderRadius.circular(30)
                                : BorderRadius.circular(15),
                            image: DecorationImage(
                                image: AssetImage(
                                  string.floor[index],
                                ),
                                fit: BoxFit.cover),
                            color: choiseIndex == index
                                ? Colors.white38
                                : Colors.white10),
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: h * 0.050,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UserGoals(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white54,
                    minimumSize: Size(double.infinity, h * 0.05)),
                child: Text(
                  AppText.next,
                  style: GoogleFonts.taviraj(
                      textStyle:
                          TextStyle(color: Colors.black, fontSize: h * 0.050)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
