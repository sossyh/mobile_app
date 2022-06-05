part of 'comment_bloc.dart';

abstract class Comment_Event extends Equatable {
  const Comment_Event();
}

class Write_comment extends Comment_Event {
  final String text;

  Write_comment({
    required this.text,
  });
  @override
  List<Object> get props => [];
}

class comment_Load extends Comment_Event {
  const comment_Load();

  @override
  List<Object> get props => [];
}

class comment_Create extends Comment_Event {
  final Comment comment;

  const comment_Create(this.comment);

  @override
  List<Object> get props => [comment];

  @override
  String toString() => 'Comment Created {user Id: ${comment.id}}';
}

class comment_Update extends Comment_Event {
  final int id;
  final Comment comment;

  const comment_Update(this.id, this.comment);

  @override
  List<Object> get props => [id, comment];

  @override
  String toString() => 'Comment Updated {user Id: ${comment.id}}';
}

class comment_Delete extends Comment_Event {
  final int id;

  const comment_Delete(this.id);

  @override
  List<Object> get props => [id];

  @override
  toString() => 'Comment Deleted {user Id: $id}';

  @override
  bool? get stringify => true;
}
