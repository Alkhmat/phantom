import 'package:flutter_bloc/flutter_bloc.dart';

class KkalTapCubit extends Cubit<int> {
  KkalTapCubit() : super(0);
  void kkaltapIndex(int index) => emit(index);
}
