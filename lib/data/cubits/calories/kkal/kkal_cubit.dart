import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phantom/data/cubits/calories/kkal/kkal_state.dart';

class KkalCubit extends Cubit<KkalState> {
  KkalCubit() : super(KkalState(value: 0));
  void kartoshka() {
    emit(KkalState(value: state.value + 10));
  }

  void pasta() {
    emit(KkalState(value: state.value + 20));
  }

  void pahlava() {
    emit(KkalState(value: state.value + 10));
  }

  void lagman() {
    emit(KkalState(value: state.value + 20));
  }

  void plov() {
    emit(KkalState(value: state.value + 10));
  }

  void sup() {
    emit(KkalState(value: state.value + 10));
  }

  void ramen() {
    emit(KkalState(value: state.value + 20));
  }

  void cola() {
    emit(KkalState(value: state.value + 20));
  }

  void fanta() {
    emit(KkalState(value: state.value + 20));
  }

  void enerdetik() {
    emit(KkalState(value: state.value + 20));
  }

  void pepsi() {
    emit(KkalState(value: state.value + 20));
  }

  void boorsok() {
    emit(KkalState(value: state.value + 20));
  }

  void bread() {
    emit(KkalState(value: state.value + 20));
  }

  void bulochka() {
    emit(KkalState(value: state.value + 20));
  }

  void burger() {
    emit(KkalState(value: state.value + 20));
  }

  void hottog() {
    emit(KkalState(value: state.value + 20));
  }

  void kfc() {
    emit(KkalState(value: state.value + 20));
  }

  void pizza() {
    emit(KkalState(value: state.value + 20));
  }

  void shaurma() {
    emit(KkalState(value: state.value + 20));
  }

  void sushi() {
    emit(KkalState(value: state.value + 20));
  }

  void carrot() {
    emit(KkalState(value: state.value + 20));
  }

  void cabbich() {
    emit(KkalState(value: state.value + 20));
  }

  void redis() {
    emit(KkalState(value: state.value + 20));
  }

  void tomato() {
    emit(KkalState(value: state.value + 20));
  }

  void pamkin() {
    emit(KkalState(value: state.value + 20));
  }

  void cucumber() {
    emit(KkalState(value: state.value + 20));
  }

  void svekla() {
    emit(KkalState(value: state.value + 20));
  }

// от сюда начинается remove kkal  по принципу если умножить то и надо сократить
  void kartoshkare() {
    int newValue = state.value - 10;
    if (newValue < 0) {
      newValue = 0;
    }
    emit(KkalState(value: newValue));
  }

  void ramenre() {
    int newValue = state.value - 20;
    if (newValue < 0) {
      newValue = 0;
    }
    emit(KkalState(value: newValue));
  }

  void pastare() {
    int newValue = state.value - 10;
    if (newValue < 0) {
      newValue = 0;
    }
    emit(KkalState(value: newValue));
  }

  void pahlavare() {
    int newValue = state.value - 20;
    if (newValue < 0) {
      newValue = 0;
    }
    emit(KkalState(value: newValue));
  }

  void lagmanre() {
    int newValue = state.value - 10;
    if (newValue < 0) {
      newValue = 0;
    }
    emit(KkalState(value: newValue));
  }

  void sunre() {
    int newValue = state.value - 20;
    if (newValue < 0) {
      newValue = 0;
    }
    emit(KkalState(value: newValue));
  }

  void plovre() {
    int newValue = state.value - 20;
    if (newValue < 0) {
      newValue = 0;
    }
    emit(KkalState(value: newValue));
  }

  void colare() {
    int newValue = state.value - 20;
    if (newValue < 0) {
      newValue = 0;
    }
    emit(KkalState(value: newValue));
  }

  void pepsire() {
    int newValue = state.value - 20;
    if (newValue < 0) {
      newValue = 0;
    }
    emit(KkalState(value: newValue));
  }

  void fantare() {
    int newValue = state.value - 20;
    if (newValue < 0) {
      newValue = 0;
    }
    emit(KkalState(value: newValue));
  }

  void enerdetikre() {
    int newValue = state.value - 20;
    if (newValue < 0) {
      newValue = 0;
    }
    emit(KkalState(value: newValue));
  }

  void breadre() {
    int newValue = state.value - 20;
    if (newValue < 0) {
      newValue = 0;
    }
    emit(KkalState(value: newValue));
  }

  void bulochkare() {
    int newValue = state.value - 20;
    if (newValue < 0) {
      newValue = 0;
    }
    emit(KkalState(value: newValue));
  }

  void boorsokre() {
    int newValue = state.value - 20;
    if (newValue < 0) {
      newValue = 0;
    }
    emit(KkalState(value: newValue));
  }

  void burgerre() {
    int newValue = state.value - 20;
    if (newValue < 0) {
      newValue = 0;
    }
    emit(KkalState(value: newValue));
  }

  void hottogre() {
    int newValue = state.value - 20;
    if (newValue < 0) {
      newValue = 0;
    }
    emit(KkalState(value: newValue));
  }

  void kfcre() {
    int newValue = state.value - 20;
    if (newValue < 0) {
      newValue = 0;
    }
    emit(KkalState(value: newValue));
  }

  void pizzare() {
    int newValue = state.value - 20;
    if (newValue < 0) {
      newValue = 0;
    }
    emit(KkalState(value: newValue));
  }

  void shaurmare() {
    int newValue = state.value - 20;
    if (newValue < 0) {
      newValue = 0;
    }
    emit(KkalState(value: newValue));
  }

  void sushire() {
    int newValue = state.value - 20;
    if (newValue < 0) {
      newValue = 0;
    }
    emit(KkalState(value: newValue));
  }

  void carrotre() {
    int newValue = state.value - 20;
    if (newValue < 0) {
      newValue = 0;
    }
    emit(KkalState(value: newValue));
  }

  void cabbichre() {
    int newValue = state.value - 20;
    if (newValue < 0) {
      newValue = 0;
    }
    emit(KkalState(value: newValue));
  }

  void redisre() {
    int newValue = state.value - 20;
    if (newValue < 0) {
      newValue = 0;
    }
    emit(KkalState(value: newValue));
  }

  void tomatore() {
    int newValue = state.value - 20;
    if (newValue < 0) {
      newValue = 0;
    }
    emit(KkalState(value: newValue));
  }

  void pamkinre() {
    int newValue = state.value - 20;
    if (newValue < 0) {
      newValue = 0;
    }
    emit(KkalState(value: newValue));
  }

  void cucumberre() {
    int newValue = state.value - 20;
    if (newValue < 0) {
      newValue = 0;
    }
    emit(KkalState(value: newValue));
  }

  void sveklare() {
    int newValue = state.value - 20;
    if (newValue < 0) {
      newValue = 0;
    }
    emit(KkalState(value: newValue));
  }
}
