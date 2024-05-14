import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phantom/data/cubits/auth/register_cubit.dart';
import 'package:phantom/data/cubits/bmi/bmi_cubit.dart';
import 'package:phantom/data/cubits/calories/kkal/kkal_cubit.dart';
import 'package:phantom/data/cubits/calories/kkal_tap/kkaltap_cunit.dart';
import 'package:phantom/data/cubits/calories/save/saveKkla_cubit.dart';
import 'package:phantom/data/cubits/click/click_cubit.dart';
import 'package:phantom/data/cubits/click_auth/clickAuth_cubit.dart';
import 'package:phantom/data/cubits/photo_pickers/image_cubit.dart';
import 'package:phantom/data/cubits/tap/tap_cubit.dart';
import 'package:phantom/firebase_options.dart';
import 'package:phantom/test_plan/start_plan/floor.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Phantom());
}

class Phantom extends StatelessWidget {
  const Phantom({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TapCubit(),
        ),
        BlocProvider(
          create: (context) => KkalTapCubit(),
        ),
        BlocProvider(
          create: (context) => KkalCubit(),
        ),
        BlocProvider(
          create: (context) => SaveKkalCubit(),
        ),
        BlocProvider(
          create: (context) => ImageCubit(),
        ),
        BlocProvider(
          create: (context) => ClickCubit(),
        ),
        BlocProvider(
          create: (context) => BodyQuizCubit(),
        ),
        BlocProvider(
          create: (context) => ClickAuthCubit(),
        ),
        BlocProvider<AuthCubit>(create: (context) => AuthCubit()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FloorPage(),
      ),
    );
  }
}
