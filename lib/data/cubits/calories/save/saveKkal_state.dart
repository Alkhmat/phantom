import 'package:phantom/data/models/calories/savekkal_model.dart';

sealed class SaveKkalState {
  SaveKkalState();
}

final class PersonInitialState extends SaveKkalState {}

final class PersonUpdateState extends SaveKkalState {
  final List<SaveKkal> person;

  PersonUpdateState(this.person);
}
