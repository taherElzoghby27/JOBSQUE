part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

//login states
class LoginLoading extends AuthState {}

class LoginLoaded extends AuthState {}

class LoginFailure extends AuthState {
  final String message;

  LoginFailure({required this.message});
}

//register states
class RegisterLoading extends AuthState {}

class RegisterLoaded extends AuthState {}

class RegisterFailure extends AuthState {
  final String message;

  RegisterFailure({required this.message});
}
