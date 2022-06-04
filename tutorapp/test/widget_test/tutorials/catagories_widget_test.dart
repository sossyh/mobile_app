import '../../../lib/tutorials/Model/tutorial_model.dart';

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
