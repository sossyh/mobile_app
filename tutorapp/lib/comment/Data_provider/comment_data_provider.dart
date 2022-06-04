import 'dart:convert';

import 'package:http/http.dart' as http;
import '../comment.dart';
import 'package:tutorapp/registration/Model/userModel.dart';
import 'package:tutorapp/tutorials/Model/tutorial_model.dart';

class CommentDataProvider {
  static const String _baseUrl = "http://10.0.2.2:9191/api/v1/comment";

  Future<Comment> create(Comment comment) async {
    final http.Response response = await http.post(Uri.parse(_baseUrl),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode({
          "id": comment.id,
          "text": comment.text,
        }));

    if (response.statusCode == 201) {
      return Comment.fromJson(jsonDecode(response.body));
    }
    {
      throw Exception("Failed to create comment");
    }
  }

  Future<Comment> fetchById(int id) async {
    final response = await http.get(Uri.parse("$_baseUrl/$id"));

    if (response.statusCode == 200) {
      return Comment.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Fetching comment failed");
    }
  }

  Future<List<Comment>> fetchAll() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      final comments = jsonDecode(response.body) as List;
      return comments.map((c) => Comment.fromJson(c)).toList();
    } else {
      throw Exception("Could not fetch the comments");
    }
  }

  Future<Comment> update(int id, Comment comment) async {
    final response = await http.put(Uri.parse("$_baseUrl/$id"),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode({
          "id": id,
          "text": comment.text,
        }));

    if (response.statusCode == 200) {
      return Comment.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Could not update the comment");
    }
  }

  Future<void> delete(int id) async {
    final response = await http.delete(Uri.parse("$_baseUrl/$id"));
    if (response.statusCode != 204) {
      throw Exception("Field to delete the comment");
    }
  }
}
