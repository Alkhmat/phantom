import 'package:flutter_bloc/flutter_bloc.dart';

class ClickAuthCubit extends Cubit<int> {
  ClickAuthCubit() : super(0);
  void tapIndex(int index) => emit(index);
}
