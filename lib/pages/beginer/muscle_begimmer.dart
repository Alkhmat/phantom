import 'package:flutter/material.dart';
import 'package:phantom/class/app_text/app_text_class.dart';
import 'package:phantom/view/training/muscle_parts/beginner/sub_back.dart';
import 'package:phantom/view/training/muscle_parts/beginner/sub_chest.dart';
import 'package:phantom/view/training/muscle_parts/beginner/sub_legs.dart';
import 'package:phantom/view/training/muscle_parts/beginner/sub_press.dart';
import 'package:phantom/widgets/string/string-class.dart';

class MuscleBeginnerPage extends StatelessWidget {
  const MuscleBeginnerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: h * 0.32,
              width: width,
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: string.beginner.length,
                controller: PageController(viewportFraction: 0.900),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      if (index == 0) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => const SubChestBeginner(),
                          ),
                        );
                      } else if (index == 1) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => const SubLegsBeginner(),
                          ),
                        );
                      } else if (index == 2) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => const SubPressBeginner(),
                          ),
                        );
                      } else if (index == 3) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => const SubBackBeginner(),
                          ),
                        );
                      }
                    },
                    child: Container(
                      height: h * 0.27,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(string.beginner[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: FittedBox(
                              child: Text(
                                string.text2[index],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                ),
                              ),
                            ),
                          ),
                          const Center(
                            child: FittedBox(
                              child: Text(
                                AppText.musclebginner,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final string = StringClass();
