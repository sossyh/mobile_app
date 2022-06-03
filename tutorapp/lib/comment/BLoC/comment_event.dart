part of 'comment_bloc.dart';

abstract class CommentEvent {}

class Commented extends CommentEvent {
  final String username;
  final String message;
  

  Commented({
    required this.username,
    required this.message
  });
 
}
List filedata = [
    {
      'name': 'Mr. Xi',
      'pic': 'https://picsum.photos/300/30',
      'message': 'GOOD JOB'
    },
    {'name': 'Mr y', 'pic': 'https://picsum.photos/300/30', 'message': ' cool'},
    {'name': 'Mr. Z', 'pic': 'https://picsum.photos/300/30', 'message': 'nice'},
    {
      'name': 'Mr. xyz',
      'pic': 'https://picsum.photos/300/30',
      'message': 'good job'
    },
  ];