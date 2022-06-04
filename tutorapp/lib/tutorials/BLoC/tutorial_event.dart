part of 'tutorial_bloc.dart';

abstract class Tutorial_Event extends Equatable {
  const Tutorial_Event();
}

class Tutorial_Load extends Tutorial_Event {
  const Tutorial_Load();

  @override
  List<Object> get props => [];
}

class Tutorial_Create extends Tutorial_Event {
  final Tutorial tutorial;

  const Tutorial_Create(this.tutorial);

  @override
  List<Object> get props => [tutorial];

  @override
  String toString() => 'Course Created {course Id: ${tutorial.id}}';
}

class Tutorilal_Update extends Tutorial_Event {
  final int id;
  final Tutorial tutorial;

  const Tutorilal_Update(this.id, this.tutorial);

  @override
  List<Object> get props => [id, tutorial];

  @override
  String toString() => 'Course Updated {course Id: ${tutorial.id}}';
}

class Tutorial_Delete extends Tutorial_Event {
  final int id;

  const Tutorial_Delete(this.id);

  @override
  List<Object> get props => [id];

  @override
  toString() => 'Course Deleted {course Id: $id}';

  @override
  bool? get stringify => true;
}
