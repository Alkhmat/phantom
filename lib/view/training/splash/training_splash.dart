// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'dart:math';

// import 'package:phantom/widgets/string/string-class.dart';

// class TrainStartView extends StatefulWidget {
//   final List<String> imageUrls;
//   const TrainStartView({required this.imageUrls, super.key});

//   @override
//   State<TrainStartView> createState() => _TrainStartViewState();
// }

// class _TrainStartViewState extends State<TrainStartView> {
//   int currentIndex = 0;
//   Random random = Random();

//   void showNextExercise() {
//     setState(() {
//       currentIndex = random.nextInt(widget.imageUrls.length);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final string = StringClass();
//     final h = MediaQuery.of(context).size.height;
//     final w = MediaQuery.of(context).size.width;
//     final currentImageUrl = widget.imageUrls[currentIndex];
//     final currentExerciseName = string.fullbody[currentIndex];
//     final currentExerciseNumber = string.fullbodynumber[currentIndex];

//     return Scaffold(
//       body: Column(
//         children: [
//           Container(
//             height: h * 0.6,
//             width: w,
//             decoration: const BoxDecoration(
//               color: Colors.amber,
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(70),
//                 bottomRight: Radius.circular(70),
//               ),
//             ),
//             child: CachedNetworkImage(
//               fit: BoxFit.cover,
//               imageUrl: currentImageUrl,
//               placeholder: (context, url) => const Center(
//                 child: CircularProgressIndicator(
//                   strokeWidth: 3.0,
//                   color: Colors.white,
//                 ),
//               ),
//               errorWidget: (context, url, error) => const Center(
//                 child: Icon(
//                   Icons.error,
//                   color: Colors.red,
//                 ),
//               ),
//             ),
//           ),
//           // SizedBox(
//           //   height: h * 0.17,
//           // ),
//           Text(
//             currentExerciseName,
//             style: GoogleFonts.teko(
//               textStyle: TextStyle(color: Colors.black, fontSize: h * 0.05),
//             ),
//           ),
//           SizedBox(
//             height: h * 0.1,
//           ),
//           Text(
//             currentExerciseNumber,
//             style: GoogleFonts.teko(
//               textStyle: TextStyle(color: Colors.black, fontSize: h * 0.04),
//             ),
//           ),

//           ElevatedButton(
//             onPressed: showNextExercise,
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.amber,
//               minimumSize: Size(w * 0.8, h * 0.07),
//             ),
//             child: const Text(
//               'Next',
//               style: TextStyle(color: Colors.black),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:math';

class TrainStartView extends StatefulWidget {
  final List<String> imageUrls;
  final List<String> exerciseNames;
  final List<String> exerciseNumbers;

  const TrainStartView({
    required this.imageUrls,
    required this.exerciseNames,
    required this.exerciseNumbers,
    super.key,
  });

  @override
  State<TrainStartView> createState() => _TrainStartViewState();
}

class _TrainStartViewState extends State<TrainStartView> {
  int currentIndex = 0;
  Random random = Random();

  void showNextExercise() {
    setState(() {
      currentIndex = random.nextInt(widget.imageUrls.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final currentImageUrl = widget.imageUrls[currentIndex];
    final currentExerciseName = widget.exerciseNames[currentIndex];
    final currentExerciseNumber = widget.exerciseNumbers[currentIndex];

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(
            height: h * 0.6,
            width: w,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(70),
                bottomLeft: Radius.circular(70),
              ),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: currentImageUrl,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 3.0,
                    color: Colors.white,
                  ),
                ),
                errorWidget: (context, url, error) => const Center(
                  child: Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: FittedBox(
              child: Text(
                currentExerciseName,
                style: GoogleFonts.teko(
                  textStyle: TextStyle(color: Colors.white, fontSize: h * 0.05),
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                currentExerciseNumber,
                style: GoogleFonts.teko(
                  textStyle: TextStyle(color: Colors.white, fontSize: h * 0.04),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: ElevatedButton(
              onPressed: showNextExercise,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white70,
                minimumSize: Size(w * 0.8, h * 0.07),
              ),
              child: const Text(
                'Next',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
