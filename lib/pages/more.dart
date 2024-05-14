import 'package:flutter/material.dart';
import 'package:phantom/view/training/options/sub_cardio.dart';
import 'package:phantom/view/training/options/sub_full_body.dart';
import 'package:phantom/widgets/string/string-class.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

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
              height: h * 0.30,
              width: width,
              child: PageView.builder(
                itemCount: string.text3.length,
                controller: PageController(viewportFraction: 0.940),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      if (index == 0) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => const SubCardioPage(),
                          ),
                        );
                      } else if (index == 1) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => const SubFullPage(),
                          ),
                        );
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(string.assets2[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Center(
                        child: FittedBox(
                          child: Text(
                            string.text3[index],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: h * 0.04,
                            ),
                          ),
                        ),
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
