import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phantom/class/app_text/app_text_class.dart';
import 'package:phantom/test_plan/start_plan/quiestions.dart';

class DataBody extends StatefulWidget {
  const DataBody({super.key});

  @override
  State<DataBody> createState() => _DataBodyState();
}

class _DataBodyState extends State<DataBody> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black54,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text('nm,.kv aksdv'),
            Container(
              height: h * 0.6,
              width: w,
              decoration: const BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(100),
                  bottomLeft: Radius.circular(100),
                ),
              ),
              child: Image.asset('assets/images/m.png'),
            ),
            SizedBox(
              height: h * 0.050,
            ),
            Text(
              AppText.bodydata,
              style: GoogleFonts.taviraj(
                  textStyle:
                      TextStyle(color: Colors.white, fontSize: h * 0.030)),
            ),
            SizedBox(
              height: h * 0.030,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BodyQuizWidget(),
                  ),
                );
              },
              child: Text(
                AppText.next,
                style: GoogleFonts.taviraj(
                  textStyle:
                      TextStyle(color: Colors.white, fontSize: h * 0.050),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
