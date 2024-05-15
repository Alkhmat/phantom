import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phantom/data/cubits/click_auth/clickAuth_cubit.dart';
import 'package:phantom/pages/auth/sign_in/sign_in.dart';
import 'package:phantom/pages/auth/sign_up/sign_up.dart';
import 'package:phantom/widgets/string/string-class.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({
    super.key,
  });

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

List<Widget> subauth = [const SignUp(), const SignIn()];

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            height: h,
            width: w,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/p.jpg'), fit: BoxFit.cover),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      height: h * 0.5,
                      width: w,
                      decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          SizedBox(
                            height: h * 0.08,
                            width: w,
                            child: BlocBuilder<ClickAuthCubit, int>(
                              builder: (context, state) {
                                return ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: string.auth.length,
                                  itemBuilder: (context, index) {
                                    return TextButton(
                                      onPressed: () {
                                        context
                                            .read<ClickAuthCubit>()
                                            .tapIndex(index);
                                      },
                                      child: Text(
                                        string.auth[index],
                                        style: GoogleFonts.teko(
                                          textStyle: TextStyle(
                                              color: state == index
                                                  ? Colors.black87
                                                  : Colors.grey.shade800,
                                              fontSize: state == index
                                                  ? h * 0.05
                                                  : h * 0.047),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: h * 0.4,
                            width: w,
                            child: BlocBuilder<ClickAuthCubit, int>(
                              builder: (context, current) {
                                if (current >= 0 && current < subauth.length) {
                                  return subauth[current];
                                } else {
                                  return const SizedBox();
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  final string = StringClass();
}
