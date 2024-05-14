import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:google_fonts/google_fonts.dart';

class SubBackAverage extends StatefulWidget {
  const SubBackAverage({
    super.key,
  });

  @override
  State<SubBackAverage> createState() => _SubBackAverageState();
}

class _SubBackAverageState extends State<SubBackAverage> {
  CountdownTimerController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = CountdownTimerController(
        endTime: DateTime.now().millisecondsSinceEpoch + 35 * 1000);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: h * 0.035,
            ),
          ),
          title: Text(
            'Back ',
            style: GoogleFonts.teko(textStyle: TextStyle(fontSize: h * 0.06)),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: width,
                height: h * 0.6,
                decoration: const BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Here Gif',
                    style: GoogleFonts.teko(
                      textStyle:
                          TextStyle(fontSize: h * 0.1, color: Colors.white),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  height: h * 0.1,
                  width: width * 0.45,
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: FittedBox(
                      child: Text(
                        'Name Ex',
                        style: GoogleFonts.teko(
                          textStyle: TextStyle(
                              color: Colors.white70, fontSize: h * 0.050),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: h * 0.040,
              ),
              CountdownTimer(
                controller: _controller,
                textStyle: TextStyle(color: Colors.black, fontSize: h * 0.05),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
