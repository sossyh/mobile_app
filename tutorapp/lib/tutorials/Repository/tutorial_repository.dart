import 'package:tutorapp/tutorials/Model/tutorial_model.dart';

import '../tutorials.dart';

class TutorialRepositoy {
  final TutorialDataProvider dataProvider;
  TutorialRepositoy(this.dataProvider);

  Future<Tutorial> create(Tutorial tutorial) async {
    return dataProvider.create(tutorial);
  }

  Future<Tutorial> update(int id, Tutorial tutorial) async {
    return dataProvider.update(id, tutorial);
  }

  Future<List<Tutorial>> fetchAll() async {
    return dataProvider.fetchAll();
  }

  Future<void> delete(int id) async {
    dataProvider.delete(id);
  }
}
