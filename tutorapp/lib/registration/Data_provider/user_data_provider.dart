import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tutorapp/registration/Model/userModel.dart';
import 'package:tutorapp/tutorials/Model/tutorial_model.dart';

import '../registration.dart';

class UserDataProvider {
  static const String _baseUrl = "http://10.0.2.2:9191/api/v1/registration";

  Future<User> create(User user) async {
    final http.Response response = await http.post(Uri.parse(_baseUrl),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode({
          "id": user.id,
          "fullname": user.fullname,
          "username": user.username,
          "email": user.email,
          "password": user.password
        }));

    if (response.statusCode == 201) {
      return User.fromJson(jsonDecode(response.body));
    }
    {
      throw Exception("Failed to create user");
    }
  }

  Future<User> fetchByUsername(String username) async {
    final response = await http.get(Uri.parse("$_baseUrl/$username"));

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Fetching user by username failed");
    }
  }

  Future<List<User>> fetchAll() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      final users = jsonDecode(response.body) as List;
      return users.map((c) => User.fromJson(c)).toList();
    } else {
      throw Exception("Could not fetch the users");
    }
  }

  Future<User> update(int id, User user) async {
    final response = await http.put(Uri.parse("$_baseUrl/$id"),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode({
          "id": id,
          "username": user.username,
          "fullname": user.fullname,
          "email": user.email
        }));

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Could not update the users profile");
    }
  }

  Future<void> delete(int id) async {
    final response = await http.delete(Uri.parse("$_baseUrl/$id"));
    if (response.statusCode != 204) {
      throw Exception("Field to delete the user");
    }
  }
}
