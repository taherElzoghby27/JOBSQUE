part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

//Auth Events
class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  LoginEvent({
    required this.email,
    required this.password,
  });
}

class RegisterEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;

  RegisterEvent({
    required this.name,
    required this.email,
    required this.password,
  });
}
