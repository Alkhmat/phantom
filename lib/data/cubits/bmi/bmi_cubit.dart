import 'package:flutter_bloc/flutter_bloc.dart';

class BodyQuizCubit extends Cubit<Map<int, int>> {
  BodyQuizCubit() : super({0: 16, 1: 50});

  void increment(int index) {
    emit({...state, index: state[index]! + 1});
  }

  void decrement(int index) {
    emit({...state, index: state[index]! - 1});
  }
}
