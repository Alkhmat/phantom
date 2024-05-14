import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:phantom/data/cubits/calories/save/saveKkal_state.dart';
import 'package:phantom/data/models/calories/savekkal_model.dart';

class SaveKkalCubit extends Cubit<SaveKkalState> {
  List<SaveKkal> listPerson = [];
  TextEditingController addController = TextEditingController();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  SaveKkalCubit() : super(PersonInitialState());

  void addData(
    String addKkal,
  ) async {
    final caloriesData = SaveKkal(
      addKkal,
    );

    try {
      await firestore.collection('calories service').add(caloriesData.toMap());
      listPerson.add(caloriesData); // Добавляем в локальный список
      emit(PersonUpdateState(
          listPerson)); // Эмитируем состояние с обновленным списком
    } catch (e) {
      // Обработайте ошибку, если не удается добавить данные в Firestore
      print('Ошибка при добавлении данных в Firestore: $e');
    }
  }

  void removeData(int index) {
    listPerson.removeAt(index);
    if (listPerson.isEmpty) {
      emit(PersonInitialState());
    } else {
      emit(PersonUpdateState(listPerson));
    }
  }

  void dispose() {
    addController.dispose();
  }
}
