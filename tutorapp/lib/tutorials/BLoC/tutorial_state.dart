part of 'tutorial_bloc.dart';

abstract class TutorialState extends Equatable {
  const TutorialState();

  @override
  List<Object> get props => [];
}

class TutorialLoading extends TutorialState {}

class Tutorial_Operation_Success extends TutorialState {
  final Iterable<Tutorial> tutorials;

  const Tutorial_Operation_Success([this.tutorials = const []]);

  @override
  List<Object> get props => [];
}

class Tutorial_Operation_Failure extends TutorialState {
  final Object error;

  const Tutorial_Operation_Failure(this.error);
  @override
  List<Object> get props => [error];
}
