part of 'registration_bloc.dart';

abstract class Registration_Event extends Equatable {
  const Registration_Event();
}

class Register extends Registration_Event {
  final String email;
  final String password;
  final String fullname;
  final String username;

  final String confirm_password;

  Register(
      {required this.email,
      required this.password,
      required this.fullname,
      required this.confirm_password,
      required this.username}
      );
  @override
  List<Object> get props => [];
}

class user_Load extends Registration_Event {
  const user_Load();

  @override
  List<Object> get props => [];
}

class user_Create extends Registration_Event {
  final User user;

  const user_Create(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'User Created {user Id: ${user.id}}';
}

class user_Update extends Registration_Event {
  final int id;
  final User user;

  const user_Update(this.id, this.user);

  @override
  List<Object> get props => [id, user];

  @override
  String toString() => 'User Updated {user Id: ${user.id}}';
}

class username_Delete extends Registration_Event {
  final int id;

  const username_Delete(this.id);

  @override
  List<Object> get props => [id];

  @override
  toString() => 'user Deleted {user Id: $id}';

  @override
  bool? get stringify => true;
}
