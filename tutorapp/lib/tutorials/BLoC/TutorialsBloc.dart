import 'dart:async';

import 'Block.dart';


class TutorialsBloc extends Block {
  List<String> _list = [
    "Tutorial_one",
    "Tutorial_two",
    "Tutorial_three",
    "Tutorial_four",
    "Tutorial_five",
    "Tutorial_six",
    "Tutorial_seven",];

  StreamController<List<String>> _tutorialsListStreamController =
      StreamController<List<String>>();

  Stream<List<String>> get productListStream =>
      _tutorialsListStreamController.stream;

  TutorialsBloc() {
    _tutorialsListStreamController.sink.add(_list);
  }

  void deleteTutorial(String name) {
    _list.remove(name);
    _tutorialsListStreamController.sink.add(_list);
   
  }

  void addNewTutorial(String name) {
    _list.add(name);
    _tutorialsListStreamController.sink.add(_list);
  }

  @override
  void dispose() {
    _tutorialsListStreamController.close();
  }
}