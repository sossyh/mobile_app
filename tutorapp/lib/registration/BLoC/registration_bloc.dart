import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(Idle()) {
    on<Register>(_onRegistering);
  }

  void _onRegistering(Register event, Emitter emit) async {
    emit(Registration());
    await Future.delayed(const Duration(seconds: 3));
    emit(RegistrationSuccessful());
  }
}
