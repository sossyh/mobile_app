import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tutorapp/authentication/authentication.dart';
import '../tutorials/test_helper_tutorial.dart';

void main() {
  test('', () {});

  test('empty email not allowed', () {
    var result = EmailValidator.validate('');
    expect(result, 'empty email not allowed');
  });

  test('empty email not allowed', () {
    var result = EmailValidator.validate('email');
    expect(result, null);
  });

  test('empty password not allowed', () {
    var result = PasswordValidator.validate('');
    expect(result, 'empty email not allowed');
  });

  test('empty password not allowed', () {
    var result = PasswordValidator.validate('password');
    expect(result, null);
  });
}
