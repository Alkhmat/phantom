import 'package:flutter_bloc/flutter_bloc.dart';

class ClickCubit extends Cubit<int> {
  ClickCubit() : super(0);
  void tapIndex(int index) => emit(index);
}
