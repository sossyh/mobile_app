part of 'registration_bloc.dart';

abstract class RegistrationState {}

class Idle extends RegistrationState {}

class Registration extends RegistrationState {}

class RegistrationSuccessful extends RegistrationState {}

class RegistrationFailed extends RegistrationState {}
