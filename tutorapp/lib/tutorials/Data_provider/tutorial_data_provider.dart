import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tutorapp/tutorials/Model/tutorial_model.dart';

import '../tutorials.dart';

class TutorialDataProvider {
  static const String _baseUrl = "http://10.0.2.2:9191/api/v1/tutorials";

  Future<Tutorial> create(Tutorial tutorial) async {
    final http.Response response = await http.post(Uri.parse(_baseUrl),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode({
          "code": tutorial.code,
          "title": tutorial.title,
          "description": tutorial.description
        }));

    if (response.statusCode == 201) {
      return Tutorial.fromJson(jsonDecode(response.body));
    }
    {
      throw Exception("Failed to create tutorial");
    }
  }

  Future<Tutorial> fetchByCode(String code) async {
    final response = await http.get(Uri.parse("$_baseUrl/$code"));

    if (response.statusCode == 200) {
      return Tutorial.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Fetching tutorial by code failed");
    }
  }

  Future<List<Tutorial>> fetchAll() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      final tutorials = jsonDecode(response.body) as List;
      return tutorials.map((c) => Tutorial.fromJson(c)).toList();
    } else {
      throw Exception("Could not fetch tutorials");
    }
  }

  Future<Tutorial> update(int id, Tutorial tutorial) async {
    final response = await http.put(Uri.parse("$_baseUrl/$id"),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode({
          "id": id,
          "code": tutorial.code,
          "title": tutorial.title,
          "description": tutorial.description
        }));

    if (response.statusCode == 200) {
      return Tutorial.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Could not update the tutorial");
    }
  }

  Future<void> delete(int id) async {
    final response = await http.delete(Uri.parse("$_baseUrl/$id"));
    if (response.statusCode != 204) {
      throw Exception("Field to delete the tutorial");
    }
  }
}
