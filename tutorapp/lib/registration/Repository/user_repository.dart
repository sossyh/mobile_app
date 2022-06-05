import 'package:tutorapp/tutorials/Model/tutorial_model.dart';

import 'package:http/http.dart' as http;
import 'package:tutorapp/registration/Model/userModel.dart';
import 'package:tutorapp/tutorials/Model/tutorial_model.dart';

import '../Data_provider/user_data_provider.dart';
import '../registration.dart';

class UserRepository {
  late final UserDataProvider dataProvider;
  UserRepository(this.dataProvider);

  Future<User> create(User user) async {
    return dataProvider.create(user);
  }

  Future<User> update(int id, User user) async {
    return dataProvider.update(id, user);
  }

  Future<List<User>> fetchAll() async {
    return dataProvider.fetchAll();
  }

  Future<void> delete(int id) async {
    dataProvider.delete(id);
  }
}
