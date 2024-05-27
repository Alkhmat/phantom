import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:phantom/data/service/storage/storage_service.dart';
import 'package:phantom/view/training/splash/training_splash.dart';
import 'package:phantom/widgets/string/string-class.dart';

class SubCardioPage extends StatefulWidget {
  const SubCardioPage({super.key});

  @override
  State<SubCardioPage> createState() => _SubCardioPageState();
}

class _SubCardioPageState extends State<SubCardioPage> {
  late Future<List<String>> imageUrls;

  @override
  void initState() {
    super.initState();
    imageUrls = StorageService.loadImages('cardio');
  }

  void startTraining(List<String> imageUrls, List<String> exerciseNames,
      List<String> exerciseNumbers) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TrainStartView(
          imageUrls: imageUrls,
          exerciseNames: exerciseNames,
          exerciseNumbers: exerciseNumbers,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final string = StringClass();
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: h * 0.35,
              width: w,
              decoration: const BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/8.jpg',
                    ),
                    fit: BoxFit.cover),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () async {
                            await showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  backgroundColor: Colors.white,
                                  title: Text(
                                    'Explanation',
                                    style: GoogleFonts.teko(
                                      textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: h * 0.045,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                  content: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      ''' Here the exercises will always \n work out differently because in \nthis way we are trying to give the\n load to different parts of the body\n equally and in this case you will\n get less tired and your body will\n focus more cells on your muscles\n and this way you get more pump from the exercise''',
                                      style: GoogleFonts.teko(
                                        textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: h * 0.03,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        'let\'s get started',
                                        style: GoogleFonts.teko(
                                          textStyle: TextStyle(
                                              color: Colors.black,
                                              fontSize: h * 0.03,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ),
                                    )
                                  ],
                                );
                              },
                            );
                          },
                          icon: Icon(
                            Icons.info_outline,
                            color: Colors.white,
                            size: h * 0.035,
                          ))
                    ],
                  ),
                ],
              ),
            ),
            FutureBuilder<List<String>>(
              future: imageUrls,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 50),
                    child: Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2.0,
                        color: Colors.white,
                      ),
                    ),
                  );
                }
                final List<String>? imageUrls = snapshot.data;
                if (imageUrls == null) {
                  return const Center(child: Text('Error loading images'));
                }
                return SizedBox(
                  height: h * 0.65,
                  width: w,
                  child: ListView.builder(
                    itemCount: imageUrls.length,
                    itemBuilder: (context, index) {
                      final imageUrl = imageUrls[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 17, vertical: 5),
                        child: Container(
                          height: h * 0.11,
                          width: w,
                          decoration: const BoxDecoration(
                            color: Colors.white24,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: h * 0.11,
                                width: w * 0.3,
                                decoration: const BoxDecoration(
                                  color: Colors.white30,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                  child: CachedNetworkImage(
                                    fit: BoxFit.fill,
                                    imageUrl: imageUrl,
                                    placeholder: (context, url) => const Center(
                                      child: CircularProgressIndicator(
                                        strokeWidth: 3.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Center(
                                      child: Icon(
                                        Icons.error,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: FittedBox(
                                      child: Text(
                                        string.cardio[index],
                                        style: GoogleFonts.teko(
                                          textStyle: TextStyle(
                                              color: Colors.white70,
                                              fontSize: h * 0.040),
                                        ),
                                      ),
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
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FutureBuilder<List<String>>(
        future: imageUrls,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(); // Return an empty container while loading
          }
          final List<String>? imageUrls = snapshot.data;
          if (imageUrls == null) {
            return Container(); // Handle the error state
          }
          return FloatingActionButton.extended(
            onPressed: () => startTraining(
              imageUrls,
              string.cardio,
              string.cardionumber,
            ),
            splashColor: Colors.grey,
            label: Text(
              'Let\'s start training',
              style: GoogleFonts.teko(
                textStyle: TextStyle(color: Colors.black, fontSize: h * 0.030),
              ),
            ),
            backgroundColor: Colors.white70,
          );
        },
      ),
    );
  }
}
