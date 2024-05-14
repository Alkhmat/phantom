import 'package:flutter/material.dart';
import 'package:phantom/class/app_text/app_text_class.dart';
import 'package:phantom/view/training/muscle_parts/average/sub_back.dart';
import 'package:phantom/view/training/muscle_parts/average/sub_chest.dart';
import 'package:phantom/view/training/muscle_parts/average/sub_legs.dart';
import 'package:phantom/view/training/muscle_parts/average/sub_press.dart';
import 'package:phantom/widgets/string/string-class.dart';

class MuscleAveragePage extends StatelessWidget {
  const MuscleAveragePage({super.key});

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
                            builder: (ctx) => const SubChestAverage(),
                          ),
                        );
                      } else if (index == 1) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => const SubLegsAverage(),
                          ),
                        );
                      } else if (index == 2) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => const SubPressAverage(),
                          ),
                        );
                      } else if (index == 3) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => const SubBackAverage(),
                          ),
                        );
                      }
                    },
                    child: Container(
                      height: h * 0.30,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(string.averege[index]),
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
                                AppText.muscleavarage,
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
