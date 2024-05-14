import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:phantom/data/cubits/auth/register_state.dart';
import 'package:phantom/data/models/auth/User_model.dart';

class AuthCubit extends Cubit<AuthState> {
  final users = FirebaseFirestore.instance
      .collection('users'); // Ссылка на коллекцию Firestore

  AuthCubit() : super(AuthInitial());

  Future<void> signUp({
    required String email,
    required String password,
    required String nic,
    required String image,
  }) async {
    try {
      emit(AuthLoading());
      final UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final uid = userCredential.user!.uid;
      final movie = UserModel(email, password, uid, nic, image);
      await addUser(movie);
      emit(AuthSuccess(movie));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(AuthError('Предоставленный пароль слишком слабый.'));
      } else if (e.code == 'email-already-in-use') {
        emit(AuthError(
            'Учетная запись с таким адресом электронной почты уже существует.'));
      } else {
        emit(AuthError('Ошибка при регистрации: $e'));
      }
    } catch (e) {
      emit(AuthError('Ошибка при регистрации: $e'));
    }
  }

  Future<void> addUser(UserModel movie) async {
    try {
      await users.doc(movie.uid).set(movie.toMap());
    } catch (e) {
      emit(AuthError('Ошибка при добавлении пользователя в Firestore: $e'));
    }
  }

  Future<void> logIn({
    required String email,
    required String password,
  }) async {
    try {
      emit(AuthLoading());
      final UserCredential credential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final UserModel moviedata =
          UserModel(email, password, credential.user!.uid, '', '');
      emit(AuthSuccess(moviedata));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        emit(AuthError('Неверный email или пароль'));
      } else {
        emit(AuthError('Ошибка при входе: $e'));
      }
    } catch (e) {
      emit(AuthError('Ошибка при входе: $e'));
    }
  }
}
