part of 'comment_bloc.dart';

abstract class Comment_State extends Equatable {
  const Comment_State();

  @override
  List<Object> get props => [];
}

class CommentLoading extends Comment_State {}

class Comment_Operation_Success extends Comment_State {
  final Iterable<Comment> comments;

  const Comment_Operation_Success([this.comments = const []]);

  @override
  List<Object> get props => [];
}

class Comment_Operation_Failure extends Comment_State {
  final Object error;

  const Comment_Operation_Failure(this.error);
  @override
  List<Object> get props => [error];
}
