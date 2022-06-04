import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tutorapp/tutorials/Model/tutorial_model.dart';
import '../tutorials.dart';
part 'tutorial_event.dart';
part 'tutorial_state.dart';

class TutorialBloc extends Bloc<Tutorial_Event, TutorialState> {
  final TutorialRepositoy tutorialRepository;

  TutorialBloc({required this.tutorialRepository}) : super(TutorialLoading()) {
    on<Tutorial_Load>((event, emit) async {
      emit(TutorialLoading());
      try {
        final tutorials = await tutorialRepository.fetchAll();
        emit(Tutorial_Operation_Success(tutorials));
      } catch (error) {
        emit(Tutorial_Operation_Failure(error));
      }
    });

    on<Tutorial_Create>((event, emit) async {
      try {
        await tutorialRepository.create(event.tutorial);
        final tutorials = await tutorialRepository.fetchAll();
        emit(Tutorial_Operation_Success(tutorials));
      } catch (error) {
        emit(Tutorial_Operation_Failure(error));
      }
    });

    on<Tutorilal_Update>((event, emit) async {
      try {
        await tutorialRepository.update(event.id, event.tutorial);
        final tutorials = await tutorialRepository.fetchAll();
        emit(Tutorial_Operation_Success(tutorials));
      } catch (error) {
        emit(Tutorial_Operation_Failure(error));
      }
    });

    on<Tutorial_Delete>((event, emit) async {
      try {
        await tutorialRepository.delete(event.id);
        final courses = await tutorialRepository.fetchAll();
        emit(Tutorial_Operation_Success(courses));
      } catch (error) {
        emit(Tutorial_Operation_Failure(error));
      }
    });
  }
}
