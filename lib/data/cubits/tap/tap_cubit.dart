import 'package:flutter_bloc/flutter_bloc.dart';

class TapCubit extends Cubit<int> {
  TapCubit() : super(0);
  void tapIndex(int index) => emit(index);
}
