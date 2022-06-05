import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:tutorapp/tutorials/tutorials.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:convert';
//import 'Tutorial.mocks.dart';

// class MockitoExample extends Mock implements http.Client {
class MockTutorial extends Mock implements Tutorial, http.Client {}

class Service extends Mock implements TutorialRepositoy {}

class email_validator {
  static validate(value) {
    return value.isEmpty ? 'empty email is not allowed' : null;
  }
}

class password_validator {
  static validate(value) {
    return value.isEmpty ? 'empty password is not allowed' : null;
  }
}
