import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phantom/data/service/storage/storage_service.dart';
import 'package:phantom/pages/average/muscle_avarge.dart';

class SubPressAverage extends StatefulWidget {
  const SubPressAverage({super.key});

  @override
  State<SubPressAverage> createState() => _SubPressAverageState();
}

class _SubPressAverageState extends State<SubPressAverage> {
  late Future<List<String>> imageUrls;

  @override
  void initState() {
    super.initState();
    imageUrls = StorageService.loadImages('avaragepress');
  }

  @override
  Widget build(BuildContext context) {
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
                      'assets/images/b.jpg',
                    ),
                    fit: BoxFit.cover),
              ),
              child: Column(
                children: [
                  Row(
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
                      )
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
                return SizedBox(
                  height: h * 0.65,
                  width: w,
                  child: ListView.builder(
                    itemCount: imageUrls?.length ?? 0,
                    itemBuilder: (context, index) {
                      final imageUrl = imageUrls![index];
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
                                        string.avaragepress[index],
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
                              // Container(
                              //   height: h * 0.11,
                              //   width: w * 0.2,
                              //   decoration: const BoxDecoration(
                              //     color: Colors.white30,
                              //     borderRadius: BorderRadius.only(
                              //       topRight: Radius.circular(20),
                              //       bottomLeft: Radius.circular(20),
                              //     ),
                              //   ),
                              //   child: Center(
                              //     child: Padding(
                              //       padding: const EdgeInsets.all(4.0),
                              //       child: FittedBox(
                              //         child: Text(
                              //           string.avaragepressnumber[index],
                              //           style: GoogleFonts.teko(
                              //             textStyle: TextStyle(
                              //                 color: Colors.black,
                              //                 fontSize: h * 0.030,
                              //                 fontWeight: FontWeight.normal),
                              //           ),
                              //         ),
                              //       ),
                              //     ),
                              //   ),
                              // ),
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
    );
  }
}
