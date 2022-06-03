part of 'comment_bloc.dart';

abstract class CommentState {}

class Idle extends CommentState {}

class Comment extends CommentState {}

class CommentSuccessful extends CommentState {}

class CommentFailed extends CommentState {}
