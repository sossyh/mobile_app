import 'package:bloc_test/bloc_test.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:tutorapp/tutorials/tutorials.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:convert';
import 'package:mockito/mockito.dart';
import '../test_helper_tutorial.dart';

const loading = TypeMatcher<TutorialLoading>();
const error = TypeMatcher<Tutorial_Operation_Failure>();
const success = TypeMatcher<Tutorial_Operation_Success>();
@GenerateMocks([TutorialRepositoy])
void main() {
  Service client = Service();

  TutorialBloc tutorialBloc = TutorialBloc(tutorialRepository: client);

  tearDown(() {
    tutorialBloc.close();
  });

  test('failed', () async {
    tutorialBloc.close();
    await expectLater(tutorialBloc.stream, emitsInOrder([emitsDone]));
  });

  test('starting state', () {
    expect(tutorialBloc.state, success);
  });

  group('tutorial bloc states', () {
    blocTest<TutorialBloc, TutorialState>(
      'emits Error',
      build: () {
        when(TutorialLoading()).thenThrow(Error);
        return TutorialBloc(tutorialRepository: client);
      },
      expect: () => [error, loading, success],
    );

    blocTest<TutorialBloc, TutorialState>(
      'emits Loading state',
      build: () {
        when(const Tutorial_Load()).thenAnswer((_) => const Tutorial_Load());
        return TutorialBloc(tutorialRepository: client);
      },
      expect: () => [error, loading, success],
    );
  });
}
