part of 'registration_bloc.dart';

abstract class RegistrationState extends Equatable {
  const RegistrationState();

  @override
  List<Object> get props => [];
}

class UserLoading extends RegistrationState {}

// class Registration extends RegistrationState {}

class User_Registration_Success extends RegistrationState {
  final Iterable<User> users;

  const User_Registration_Success([this.users = const []]);

  @override
  List<Object> get props => [];
}

class User_Registration_Failure extends RegistrationState {
  final Object error;

  const User_Registration_Failure(this.error);
  @override
  List<Object> get props => [error];
}
