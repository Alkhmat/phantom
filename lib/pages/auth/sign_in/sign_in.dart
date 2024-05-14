import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phantom/class/app_text/app_text_class.dart';
import 'package:phantom/data/cubits/auth/register_cubit.dart';
import 'package:phantom/view/auth/profile/profile_view.dart';
import 'package:phantom/widgets/auth/register_fieled.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    final TextEditingController emailController0 = TextEditingController();
    final TextEditingController passwordController0 = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          CustomRegisterField(
            labelText: 'Email',
            prefixIcon: const Icon(Icons.alternate_email_outlined),
            controller: emailController0,
          ),
          CustomRegisterField(
            labelText: 'password',
            prefixIcon: const Icon(Icons.password_outlined),
            controller: passwordController0,
          ),
          ElevatedButton(
            onPressed: () async {
              context.read<AuthCubit>().logIn(
                    email: emailController0.text,
                    password: passwordController0.text,
                  );
              final currentUser = FirebaseAuth.instance.currentUser;
              if (currentUser != null) {
                DocumentSnapshot userData = await FirebaseFirestore.instance
                    .collection('users')
                    .doc(currentUser.uid)
                    .get();
                emailController0.clear();
                passwordController0.clear();
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
              AppText.singin,
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
