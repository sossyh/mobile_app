import 'package:http/http.dart' as http;
import 'package:tutorapp/tutorials/tutorials.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:convert';
import 'package:mockito/mockito.dart';
import '../test_helper_tutorial.dart';

@GenerateMocks([Tutorial])
void main() {
  group('Read', () {
    test('returns a tutorial if the http call completes successfully',
        () async {
      final client = MockTutorial();

      when(client.get(
              Uri.parse('https://jsonplaceholder.typicode.com/tutorials/1')))
          .thenAnswer((_) async => http.Response(
              '{"id": 1, "code": "tutorial code 1", "title": "MobileApp developement", "description":"Lorem"}',
              200));

      expect(await Tutorial_Create(client), isA<Tutorial>());
    });

    test('throws an exception if the http call completes with an error', () {
      final client = MockTutorial();

      when(client
              .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(Tutorial_Create(client), throwsException);
    });
  });
  group('update', () {
    test('returns updated tutorial if the http call completes successfully',
        () async {
      final client = MockTutorial();

      when(client.put(
              Uri.parse('https://jsonplaceholder.typicode.com/tutorials/1')))
          .thenAnswer((_) async => http.Response(
              '{"id": 1, "code": "tutorial code 1", "title": "MobileApp developement", "description":"Lorem"}',
              200));

      expect(await Tutorial_Create(client), isA<Tutorial>());
    });

    test('throws an exception if the http call completes with an error', () {
      final client = MockTutorial();

      when(client
              .put(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(Tutorial_Create(client), throwsException);
    });
  });
  group('create', () {
    test('creates a tutorial if the http call completes successfully',
        () async {
      final client = MockTutorial();

      when(client.post(
              Uri.parse('https://jsonplaceholder.typicode.com/tutorials/1')))
          .thenAnswer((_) async => http.Response(
              '{"id": 1, "code": "tutorial code 1", "title": "MobileApp developement", "description":"Lorem"}',
              200));

      expect(await Tutorial_Create(client), isA<Tutorial>());
    });

    test('throws an exception if the http call completes with an error', () {
      final client = MockTutorial();

      when(client
              .post(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(Tutorial_Create(client), throwsException);
    });
  });
}
