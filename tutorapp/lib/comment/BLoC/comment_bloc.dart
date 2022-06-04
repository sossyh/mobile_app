import 'package:flutter_bloc/flutter_bloc.dart';
part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  CommentBloc() : super(Idle()) {
    on<Commented>(_onRegistering);
  }

  void _onRegistering(Commented event, Emitter emit) async {
    emit(Comment());
    await Future.delayed(const Duration(seconds: 3));
    emit(CommentSuccessful());
  }
}
