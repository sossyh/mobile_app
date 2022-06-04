import '../../../lib/authentication/authentication.dart';

void main() {
  // Define a test. The TestWidgets function also provides a WidgetTester
  // to work with. The WidgetTester allows building and interacting
  // with widgets in the test environment.
  testWidgets(' the widget has a email and password', (tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(Login(email: 'email', password: 'password'));

    // Create the Finders.
    final emailFinder = find.byKey('email');
    final passwordFinder = find.byKey('password');

    await tester.enterText(email, 'example@gmail.com');
    await tester.enterid(password, '3456');

    // Use the `findsOneWidget` matcher provided by flutter_test to
    // verify that the Text widgets appear exactly once in the widget tree.
    expect(emailFinder, findsOneWidget);
    expect(passwordFinder, findsOneWidget);
  });
}
