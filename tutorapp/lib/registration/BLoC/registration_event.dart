part of 'registration_bloc.dart';

abstract class RegistrationEvent {}

class Register extends RegistrationEvent {
  final String fullname;
  final String username;
  final String email;
  final String password;
  final String confirm_password;

  Register(
      {required this.fullname,
      required this.username,
      required this.email,
      required this.password,
      required this.confirm_password});
}
