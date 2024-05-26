import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phantom/class/app_text/app_text_class.dart';
import 'package:phantom/data/cubits/tap/tap_cubit.dart';
import 'package:phantom/pages/average/muscle_avarge.dart';
import 'package:phantom/pages/beginer/muscle_begimmer.dart';
import 'package:phantom/pages/experienced/muscle_experienced.dart';
import 'package:phantom/pages/more.dart';
import 'package:phantom/view/auth/register/register_viuw.dart';
import 'package:phantom/view/calories/kkal_view.dart';
import 'package:phantom/view/save/save_view.dart';
import 'package:phantom/view/setting/setting_view.dart';
import 'package:phantom/widgets/string/string-class.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Widget> subHome = [
    const MuscleBeginnerPage(),
    const MuscleAveragePage(),
    const MuscleExperiencePage()
  ];
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final string = StringClass();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      AppText.hometext,
                      style: GoogleFonts.teko(
                          textStyle: TextStyle(
                              color: Colors.white70, fontSize: h * 0.06)),
                    ),
                  ),
                ],
              ),
              Container(
                height: h * 0.3,
                width: w,
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.white60,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: FittedBox(
                    child: Text(
                      AppText.homeplan,
                      style: GoogleFonts.teko(
                        textStyle:
                            TextStyle(color: Colors.black, fontSize: h * 0.06),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                    child: Text(
                      AppText.firctoptions,
                      style: GoogleFonts.teko(
                          textStyle: TextStyle(
                              color: Colors.white, fontSize: h * 0.04)),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: SizedBox(
                  height: h * 0.09,
                  width: w,
                  child: ListView.builder(
                    itemCount: string.icon1.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          if (index == 0) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const KkalView(),
                              ),
                            );
                          } else if (index == 1) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SaveViuw(),
                              ),
                            );
                          } else if (index == 2) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegisterView(),
                              ),
                            );
                          } else if (index == 3) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SettingView(),
                              ),
                            );
                          }
                        },
                        child: Container(
                          height: h * 0.03,
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          width: w * 0.21,
                          decoration: BoxDecoration(
                            color: Colors.white60,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: SizedBox(
                              height: h * 0.065,
                              width: h * 0.065,
                              child: Image.asset(
                                string.icon1[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                    child: Text(
                      AppText.options,
                      style: GoogleFonts.teko(
                          textStyle: TextStyle(
                              color: Colors.white, fontSize: h * 0.04)),
                    ),
                  )
                ],
              ),
              SizedBox(height: h * 0.30, width: w, child: const MorePage()),
              Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                    child: FittedBox(
                      child: Text(
                        AppText.secondoptions,
                        style: GoogleFonts.teko(
                            textStyle: TextStyle(
                                color: Colors.white, fontSize: h * 0.04)),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SizedBox(
                  height: h * 0.05,
                  width: w,
                  child: BlocBuilder<TapCubit, int>(
                    builder: (context, state) {
                      return ListView.builder(
                        itemCount: string.text5.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              context.read<TapCubit>().tapIndex(index);
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 270),
                              height: h * 0.05,
                              width: w * 0.25,
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                  color: state == index
                                      ? Colors.white70
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(
                                      state == index ? 30 : 20)),
                              child: Center(
                                child: FittedBox(
                                  child: Text(
                                    string.text5[index],
                                    style: GoogleFonts.teko(
                                      textStyle: TextStyle(
                                          color: state == index
                                              ? Colors.black
                                              : Colors.white,
                                          fontSize: h * 0.025),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: SizedBox(
                  height: h * 0.32,
                  width: w,
                  child: BlocBuilder<TapCubit, int>(
                    builder: (context, current) {
                      if (current >= 0 && current < subHome.length) {
                        return subHome[current];
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
