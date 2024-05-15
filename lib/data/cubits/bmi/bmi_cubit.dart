import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phantom/data/models/body_parametrs/body_data.dart';

class BodyQuizCubit extends Cubit<BodyParameters> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _parametersCollection =
      FirebaseFirestore.instance.collection('body_parameters');

  BodyQuizCubit()
      : super(BodyParameters(height: 0.0, parameter1: 16, parameter2: 50));

  void updateHeight(double value) {
    emit(state.copyWith(height: value));
    _saveToFirestore();
  }

  void updateParameter1(int value) {
    emit(state.copyWith(parameter1: value));
    _saveToFirestore();
  }

  void updateParameter2(int value) {
    emit(state.copyWith(parameter2: value));
    _saveToFirestore();
  }

  Future<void> _saveToFirestore() async {
    try {
      await _parametersCollection.doc('default').set(state.toMap());
    } catch (e) {
      print('Error saving parameters: $e');
    }
  }

  Future<void> loadFromFirestore() async {
    try {
      final snapshot = await _parametersCollection.doc('default').get();
      if (snapshot.exists) {
        final data = snapshot.data() as Map<String, dynamic>;
        emit(BodyParameters.fromMap(data));
      }
    } catch (e) {
      print('Error loading parameters: $e');
    }
  }
}
