import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tutorapp/registration/Model/userModel.dart';
import '../comment.dart';
import '../Repository/comment_repository.dart';
part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<Comment_Event, Comment_State> {
  final CommentRepository commentRepository;

  CommentBloc({required this.commentRepository}) : super(CommentLoading()) {
    on<comment_Load>((event, emit) async {
      emit(CommentLoading());
      try {
        final comments = await commentRepository.fetchAll();
        emit(Comment_Operation_Success(comments));
      } catch (error) {
        emit(Comment_Operation_Failure(error));
      }
    });

    on<comment_Create>((event, emit) async {
      try {
        await commentRepository.create(event.comment);
        final comments = await commentRepository.fetchAll();
        emit(Comment_Operation_Success(comments));
      } catch (error) {
        emit(Comment_Operation_Failure(error));
      }
    });

    on<comment_Update>((event, emit) async {
      try {
        await commentRepository.update(event.id, event.comment);
        final comments = await commentRepository.fetchAll();
        emit(Comment_Operation_Success(comments));
      } catch (error) {
        emit(Comment_Operation_Failure(error));
      }
    });

    on<comment_Delete>((event, emit) async {
      try {
        await commentRepository.delete(event.id);
        final comments = await commentRepository.fetchAll();
        emit(Comment_Operation_Success(comments));
      } catch (error) {
        emit(Comment_Operation_Failure(error));
      }
    });
  }
}
