import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phantom/class/app_text/app_text_class.dart';
import 'package:phantom/data/cubits/click/click_cubit.dart';
import 'package:phantom/test_plan/start_plan/body_data.dart';
import 'package:phantom/widgets/string/string-class.dart';

class UserGoals extends StatefulWidget {
  const UserGoals({super.key});

  @override
  State<UserGoals> createState() => _UserGoalsState();
}

class _UserGoalsState extends State<UserGoals> {
  final string = StringClass();
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                // SizedBox(
                //   height: h * 0.020,
                // ),
                Text(
                  'Choose what you want',
                  style: GoogleFonts.teko(
                    textStyle:
                        TextStyle(color: Colors.white70, fontSize: h * 0.050),
                  ),
                ),
                SizedBox(
                  height: h * 0.82,
                  width: w,
                  child: BlocBuilder<ClickCubit, int>(
                    builder: (context, state) {
                      return ListView.builder(
                        itemCount: string.goals.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              context.read<ClickCubit>().tapIndex(index);
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 250),
                              margin: const EdgeInsets.all(4),
                              height: state == index ? h * 0.41 : h * 0.39,
                              width: w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white24,
                                image: DecorationImage(
                                    image: AssetImage(
                                      string.goals[index],
                                    ),
                                    fit: BoxFit.cover),
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      string.text6[index],
                                      style: GoogleFonts.teko(
                                          textStyle: TextStyle(
                                              color: state == index
                                                  ? Colors.black87
                                                  : Colors.transparent,
                                              fontSize: state == index
                                                  ? h * 0.074
                                                  : h * 0.070)),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: h * 0.010,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DataBody(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white54,
                    minimumSize: Size(double.infinity, h * 0.048),
                  ),
                  child: Text(
                    AppText.next,
                    style: GoogleFonts.taviraj(
                      textStyle:
                          TextStyle(color: Colors.black, fontSize: h * 0.050),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
