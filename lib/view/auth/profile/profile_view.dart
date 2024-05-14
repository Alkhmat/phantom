import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phantom/class/app_text/app_text_class.dart';
import 'package:phantom/data/cubits/photo_pickers/image_cubit.dart';
import 'package:phantom/view/home/home_view.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, required this.userData});

  final DocumentReference userData;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade800,
        body: StreamBuilder<DocumentSnapshot>(
          stream: userData.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (!snapshot.hasData || snapshot.data == null) {
              return const Center(
                child: Text('No Data Available'),
              );
            }

            // Получаем данные из снимка
            var data = snapshot.data!.data() as Map<String, dynamic>?;

            if (data == null ||
                !data.containsKey('nic') ||
                !data.containsKey('useremail')) {
              return const Center(
                child: Text('Data is incomplete'),
              );
            }

            return SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeView(),
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: h * 0.035,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        AppText.profile,
                        style: GoogleFonts.teko(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: h * 0.055,
                          ),
                        ),
                      ),
                    ],
                  ),
                  BlocBuilder<ImageCubit, ImageState>(
                    builder: (context, state) {
                      if (state is ImageInitial) {
                        return GestureDetector(
                          onTap: () {
                            context.read<ImageCubit>().pickerPhoto();
                          },
                          child: CircleAvatar(
                            radius: h * 0.17,
                            backgroundColor: Colors.white70,
                            child: Center(
                              child: Icon(
                                Icons.camera_alt_outlined,
                                size: h * 0.05,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        );
                      } else if (state is ImageLoaded) {
                        return GestureDetector(
                          onTap: () {
                            context.read<ImageCubit>().reset();
                          },
                          child: CircleAvatar(
                            backgroundImage: FileImage(
                              File(state.images),
                            ),
                            radius: h * 0.17,
                            backgroundColor: Colors.white70,
                          ),
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                  SizedBox(
                    height: h * 0.08,
                  ),
                  Container(
                    height: h * 0.08,
                    width: w * 0.75,
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: FittedBox(
                        child: Text(
                          data['nic'],
                          style: GoogleFonts.teko(
                              textStyle: TextStyle(fontSize: h * 0.060)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Container(
                      height: h * 0.08,
                      width: w * 0.75,
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: FittedBox(
                          child: Text(
                            data['useremail'],
                            style: GoogleFonts.teko(
                                textStyle: TextStyle(fontSize: h * 0.045)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
