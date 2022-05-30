part of 'authentication_BLoC.dart';

abstract class AuthEvent {}

class Login extends AuthEvent {
  final String email;
  final String password;

  Login({required this.email, required this.password});
}
