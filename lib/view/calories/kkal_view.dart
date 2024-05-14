import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phantom/calories/pages/beveroges.dart';
import 'package:phantom/calories/widgets/custom_fieled.dart';
import 'package:phantom/calories/pages/fastFood.dart';
import 'package:phantom/calories/pages/flour.dart';
import 'package:phantom/calories/pages/foods.dart';
import 'package:phantom/calories/pages/friuts.dart';
import 'package:phantom/calories/pages/meat.dart';
import 'package:phantom/calories/pages/sweet.dart';
import 'package:phantom/calories/pages/vegetables.dart';
import 'package:phantom/class/app_text/app_text_class.dart';
import 'package:phantom/data/cubits/calories/kkal/kkal_cubit.dart';
import 'package:phantom/data/cubits/calories/kkal/kkal_state.dart';
import 'package:phantom/data/cubits/calories/kkal_tap/kkaltap_cunit.dart';
import 'package:phantom/data/cubits/calories/save/saveKkla_cubit.dart';
import 'package:phantom/view/save/save_view.dart';
import 'package:phantom/widgets/string/string-class.dart';

class KkalView extends StatefulWidget {
  const KkalView({
    super.key,
  });

  @override
  State<KkalView> createState() => _KkalViewState();
}

class _KkalViewState extends State<KkalView> {
  List<Widget> subkkalpage = [
    const FoodKkal(),
    const BevergesKkal(),
    const FLourKkal(),
    const FastFoodKkal(),
    const VegetablesKkal(),
    const FruitsKkal(),
    const SweetKkal(),
    const MeatKkal()
  ];
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final string = StringClass();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text(
            AppText.kkalcounter,
            style: GoogleFonts.teko(
                textStyle:
                    TextStyle(color: Colors.white70, fontSize: h * 0.045)),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white70,
                size: h * 0.033,
              )),
        ),
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: h * 0.1,
                width: w,
                margin: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                    color: Colors.white54,
                    border: Border.all(color: Colors.white70),
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                  child: BlocBuilder<KkalCubit, KkalState>(
                    builder: (context, state) {
                      return FittedBox(
                        child: Text(
                          'Kkal: ${state.value}',
                          style: GoogleFonts.teko(
                              textStyle: TextStyle(fontSize: h * 0.07)),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Container(
                height: h * 0.06,
                margin: const EdgeInsets.symmetric(vertical: 8),
                width: w,
                child: BlocBuilder<KkalTapCubit, int>(
                  builder: (context, state) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: string.text4.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            context.read<KkalTapCubit>().kkaltapIndex(index);
                          },
                          child: Container(
                            height: h * 0.06,
                            width: w * 0.23,
                            margin: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Colors.white54,
                              border: Border.all(
                                  color: Colors.white70, width: w * 0.003),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: FittedBox(
                                child: Text(
                                  string.text4[index],
                                  style: GoogleFonts.teko(
                                      textStyle: TextStyle(fontSize: h * 0.03)),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              SizedBox(
                height: h * 0.738,
                width: double.infinity,
                child: BlocBuilder<KkalTapCubit, int>(
                  builder: (context, current) {
                    if (current >= 0 && current < subkkalpage.length) {
                      return subkkalpage[current];
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white70,
          child: Icon(
            Icons.add_outlined,
            size: h * 0.05,
            color: Colors.black,
          ),
          onPressed: () async {
            await showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(
                    AppText.kkaldata,
                    style: GoogleFonts.josefinSans(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: h * 0.025,
                      ),
                    ),
                  ),
                  content: BlocBuilder<KkalCubit, KkalState>(
                    builder: (context, state) {
                      return CustomKkalField(
                        controller: context.read<SaveKkalCubit>().addController,
                        label: Text(state.value.toString()),
                        prefixIcon: const Icon(Icons.add_outlined),
                        onChanged: (p0) {},
                        keyboardType: TextInputType.number,
                      );
                    },
                  ),
                  backgroundColor: Colors.white,
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                      child: Text(
                        AppText.cencel,
                        style: GoogleFonts.teko(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: h * 0.025,
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        final addKkal =
                            context.read<SaveKkalCubit>().addController.text;
                        context.read<SaveKkalCubit>().addData(
                              addKkal,
                            );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SaveViuw(),
                          ),
                        ); // Закрыть диалоговое окно
                      },
                      child: Text(
                        AppText.save,
                        style: GoogleFonts.teko(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: h * 0.025,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
