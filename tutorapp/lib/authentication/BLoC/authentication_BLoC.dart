import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(Idle()) {
    on<Login>(_onLogin);
  }

  void _onLogin(Login event, Emitter emit) async {
    emit(LogingIn());
    await Future.delayed(const Duration(seconds: 3));
    emit(LoginSuccessful());
  }
}
