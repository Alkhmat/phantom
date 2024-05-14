import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phantom/class/app_text/app_text_class.dart';
import 'package:phantom/data/cubits/auth/register_cubit.dart';
import 'package:phantom/data/cubits/photo_pickers/image_cubit.dart';
import 'package:phantom/view/auth/profile/profile_view.dart';
import 'package:phantom/widgets/auth/register_fieled.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController userController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          CustomRegisterField(
            labelText: 'User name',
            prefixIcon: const Icon(Icons.person_outline),
            controller: userController,
          ),
          CustomRegisterField(
            labelText: 'Email',
            prefixIcon: const Icon(Icons.alternate_email_outlined),
            controller: emailController,
          ),
          CustomRegisterField(
            labelText: 'password',
            prefixIcon: const Icon(Icons.password_outlined),
            controller: passwordController,
          ),
          ElevatedButton(
            onPressed: () async {
              final state = ImageInitial();
              context.read<AuthCubit>().signUp(
                    image: state.toString(),
                    nic: userController.text,
                    email: emailController.text,
                    password: passwordController.text,
                  );
              final currentUser = FirebaseAuth.instance.currentUser;
              if (currentUser != null) {
                DocumentSnapshot userData = await FirebaseFirestore.instance
                    .collection('users')
                    .doc(currentUser.uid)
                    .get();
                emailController.clear();
                passwordController.clear();
                userController.clear();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(
                      userData: userData.reference,
                    ),
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black87,
                minimumSize: Size(w * 0.2, h * 0.060)),
            child: Text(
              AppText.singup,
              style: GoogleFonts.teko(
                  textStyle: TextStyle(
                      color: Colors.white70,
                      fontSize: h * 0.035,
                      fontWeight: FontWeight.normal)),
            ),
          ),
        ],
      ),
    );
  }
}
