import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phantom/data/cubits/calories/kkal/kkal_cubit.dart';
import 'package:phantom/data/service/storage/storage_service.dart';

class FoodKkal extends StatefulWidget {
  const FoodKkal({super.key});

  @override
  State<FoodKkal> createState() => _FoodKkalState();
}

class _FoodKkalState extends State<FoodKkal> {
  late Future<List<String>> imageUrls;

  @override
  void initState() {
    super.initState();
    imageUrls = StorageService.loadImages('foods');
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    // final string = StringClass();

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: FutureBuilder<List<String>>(
          future: imageUrls,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            }
            final List<String>? imageUrls = snapshot.data;
            return SizedBox(
              height: h * 0.719,
              width: w,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: imageUrls?.length ?? 0,
                itemBuilder: (context, index) {
                  final imageUrl = imageUrls![index];
                  VoidCallback onPressedAddkkal;
                  VoidCallback onPressedRemovekkal;
                  switch (index) {
                    case 0:
                      onPressedAddkkal = () {
                        context.read<KkalCubit>().pasta();
                      };

                      break;
                    case 1:
                      onPressedAddkkal = () {
                        context.read<KkalCubit>().kartoshka();
                      };
                    case 2:
                      onPressedAddkkal = () {
                        context.read<KkalCubit>().lagman();
                      };
                    case 3:
                      onPressedAddkkal = () {
                        context.read<KkalCubit>().pahlava();
                      };
                    case 4:
                      onPressedAddkkal = () {
                        context.read<KkalCubit>().plov();
                      };
                    case 5:
                      onPressedAddkkal = () {
                        context.read<KkalCubit>().ramen();
                      };
                    case 6:
                      onPressedAddkkal = () {
                        context.read<KkalCubit>().sup();
                      };

                      break;
                    default:
                      onPressedAddkkal = () {};
                      break;
                  }
                  switch (index) {
                    case 0:
                      onPressedRemovekkal = () {
                        context.read<KkalCubit>().pastare();
                      };

                      break;
                    case 1:
                      onPressedRemovekkal = () {
                        context.read<KkalCubit>().kartoshkare();
                      };

                      break;
                    case 2:
                      onPressedRemovekkal = () {
                        context.read<KkalCubit>().lagmanre();
                      };

                      break;
                    case 3:
                      onPressedRemovekkal = () {
                        context.read<KkalCubit>().pahlavare();
                      };

                      break;
                    case 4:
                      onPressedRemovekkal = () {
                        context.read<KkalCubit>().plovre();
                      };

                      break;
                    case 5:
                      onPressedRemovekkal = () {
                        context.read<KkalCubit>().ramenre();
                      };

                      break;
                    case 6:
                      onPressedRemovekkal = () {
                        context.read<KkalCubit>().sunre();
                      };

                      break;
                    default:
                      onPressedRemovekkal = () {};
                      break;
                  }
                  return Container(
                    margin: const EdgeInsets.all(3),
                    height: h * 0.2,
                    decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          CachedNetworkImage(
                            imageUrl: imageUrl,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator(
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
                          Column(
                            children: [
                              SizedBox(
                                height: h * 0.16,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: onPressedAddkkal,
                                    style: IconButton.styleFrom(
                                        backgroundColor: Colors.black54),
                                    icon: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: h * 0.06,
                                    ),
                                  ),
                                  SizedBox(
                                    width: w * 0.03,
                                  ),
                                  IconButton(
                                    onPressed: onPressedRemovekkal,
                                    style: IconButton.styleFrom(
                                        backgroundColor: Colors.black54),
                                    icon: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                      size: h * 0.06,
                                    ),
                                  ),
                                ],
                              ),
                            ],
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
      ),
    );
  }
}
