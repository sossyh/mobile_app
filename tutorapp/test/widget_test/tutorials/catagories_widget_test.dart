import '../../../lib/tutorials/Model/tutorial_model.dart';
import '../../../lib/authentication/authentication.dart';
import 'package:http/http.dart' as http;
import 'package:tutorapp/tutorials/tutorials.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:convert';
import 'package:mockito/mockito.dart';
import '../../unit_test/tutorials/test_helper_tutorial.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('testing catagories widgets', (WidgetTester tester) async {
    final titleFinder = find.text('Text');
    await tester.pumpWidget(MaterialApp(
      home: catagories(
        course: Tutorial(
            id: 021, code: "456", title: "flutter", description: "flutter"),
        tutorialRepositoy: TutorialRepositoy(TutorialDataProvider()),
      ),
    ));
    expect(titleFinder, findsOneWidget);
  });
}
