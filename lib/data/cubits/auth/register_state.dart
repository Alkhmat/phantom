import 'package:phantom/data/models/auth/User_model.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final UserModel movie;

  AuthSuccess(this.movie);
}

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);
}
