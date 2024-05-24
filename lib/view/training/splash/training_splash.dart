import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:math';

import 'package:phantom/view/home/home_view.dart';

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
  late List<int> exerciseOrder;
  final Random random = Random();

  @override
  void initState() {
    super.initState();
    exerciseOrder = _generateExerciseOrder(widget.imageUrls.length);
  }

  List<int> _generateExerciseOrder(int length) {
    // Create a list where each index appears twice
    List<int> order = List.generate(length * 2, (index) => index % length);
    order.shuffle(random);
    return order;
  }

  void showNextExercise() {
    setState(() {
      if (currentIndex < exerciseOrder.length - 1) {
        currentIndex++;
      } else {
        // Navigate to HomeView when all exercises are done
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeView(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final currentExerciseIndex = exerciseOrder[currentIndex];
    final currentImageUrl = widget.imageUrls[currentExerciseIndex];
    final currentExerciseName = widget.exerciseNames[currentExerciseIndex];
    final currentExerciseNumber = widget.exerciseNumbers[currentExerciseIndex];

    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //     icon: const Icon(Icons.arrow_back_ios),
      //   ),
      // ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(
            height: h * 0.57,
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
