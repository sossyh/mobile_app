import 'package:http/http.dart' as http;

import '../comment.dart';

class CommentRepository {
  late final CommentDataProvider dataProvider;
  CommentRepository(this.dataProvider);

  Future<Comment> create(Comment comment) async {
    return dataProvider.create(comment);
  }

  Future<Comment> update(int id, Comment comment) async {
    return dataProvider.update(id, comment);
  }

  Future<List<Comment>> fetchAll() async {
    return dataProvider.fetchAll();
  }

  Future<void> delete(int id) async {
    dataProvider.delete(id);
  }
}
