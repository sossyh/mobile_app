import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tutorapp/registration/Model/userModel.dart';
import '../registration.dart';
import '../Repository/user_repository.dart';
part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<Registration_Event, RegistrationState> {
  final UserRepository userRepository;

  RegistrationBloc({required this.userRepository}) : super(UserLoading()) {
    on<user_Load>((event, emit) async {
      emit(UserLoading());
      try {
        final users = await userRepository.fetchAll();
        emit(User_Registration_Success(users));
      } catch (error) {
        emit(User_Registration_Failure(error));
      }
    });

    on<user_Create>((event, emit) async {
      try {
        await userRepository.create(event.user);
        final users = await userRepository.fetchAll();
        emit(User_Registration_Success(users));
      } catch (error) {
        emit(User_Registration_Failure(error));
      }
    });

    on<user_Update>((event, emit) async {
      try {
        await userRepository.update(event.id, event.user);
        final users = await userRepository.fetchAll();
        emit(User_Registration_Success(users));
      } catch (error) {
        emit(User_Registration_Failure(error));
      }
    });

    on<username_Delete>((event, emit) async {
      try {
        await userRepository.delete(event.id);
        final courses = await userRepository.fetchAll();
        emit(User_Registration_Success(courses));
      } catch (error) {
        emit(User_Registration_Failure(error));
      }
    });
  }
}
