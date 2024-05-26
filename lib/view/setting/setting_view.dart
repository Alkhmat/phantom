import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phantom/widgets/string/string-class.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  final string = StringClass();
  List<bool> switchStates = List<bool>.generate(1, (index) => false);

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: h * 0.035,
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Text(
                        'Settings',
                        style: GoogleFonts.teko(
                          textStyle: TextStyle(
                              color: Colors.white, fontSize: h * 0.05),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: h * 0.91,
                width: w,
                child: ListView.builder(
                  itemCount: string.settings.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      height: h * 0.1,
                      width: w,
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                ),
                                child: Text(
                                  'Theme',
                                  style: GoogleFonts.teko(
                                    textStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: h * 0.04,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  'choose a theme for the application ',
                                  style: GoogleFonts.teko(
                                    textStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: h * 0.025,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Switch(
                            value: switchStates[index],
                            activeColor: Colors.white,
                            inactiveTrackColor: Colors.black87,
                            thumbIcon: const MaterialStatePropertyAll(
                              Icon(Icons.wb_sunny_outlined),
                            ),
                            onChanged: (bool value) {
                              setState(
                                () {
                                  switchStates[index] = value;
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
