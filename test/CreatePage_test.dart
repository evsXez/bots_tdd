import 'package:bots_tdd/data/User.dart';
import 'package:bots_tdd/network/API.dart';
import 'package:bots_tdd/network/NetworkRequestError.dart';
import 'package:bots_tdd/network/NetworkRequestResult.dart';
import 'package:bots_tdd/pages/CreatePage.dart';
import 'package:bots_tdd/resources/Strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {



  testWidgets('has two input fields with proper hints', (WidgetTester tester) async {
    await prepare(tester);
    expect(name, findsOneWidget);
    expect(comment, findsOneWidget);
  });

  testWidgets('button CREATE saves the data', (WidgetTester tester) async {
    final userName = "John Dert";
    final userComment = "no comments...";

    await prepare(tester);
    expect(button, findsOneWidget);
    await tester.enterText(name, userName);
    await tester.enterText(comment, userComment);
    await tester.tap(button);

    expect(userStorage.last.name, userName);
    expect(userStorage.last.comment, userComment);
  });

  testWidgets('successful save -> clear fields', (WidgetTester tester) async {
    final userName = "John Dert";
    final userComment = "no comments...";

    await prepare(tester);
    await tester.enterText(name, userName);
    await tester.enterText(comment, userComment);
    await tester.tap(button);
    await tester.pump();

    final nameField = await tester.widget<TextField>(name);
    final commentField = await tester.widget<TextField>(comment);

    expect(nameField.controller.text, "");
    expect(commentField.controller.text, "");
  });

  testWidgets('successful save -> show message', (WidgetTester tester) async {
    await prepare(tester);
    await tester.tap(button);
    await tester.pumpAndSettle();
    expect(find.text(MockAPI.CREATED_MESSAGE), findsOneWidget);
  });

  testWidgets('no input -> save "Mr. Anonym" ', (WidgetTester tester) async {
    await prepare(tester);
    await tester.tap(button);
    await tester.pump();
    expect(userStorage.last.name, Strings.anonym);
  });

  testWidgets('error -> show message', (WidgetTester tester) async {
    await prepare(tester, mockAPI: MockAPI(errorMode: true));
    await tester.tap(button);
    await tester.pumpAndSettle();
    expect(find.text(MockAPI.ERROR_MESSAGE), findsOneWidget);
  });


}

List<User> userStorage;

Future<void> prepare(WidgetTester tester, {MockAPI mockAPI}) async {
  widgetsSetUp();
  return tester.pumpWidget(MaterialApp(home: Scaffold(body: CreatePage(mockAPI ?? MockAPI()))));
}

void widgetsSetUp() {
  userStorage = [];
}

Finder get name => find.widgetWithText(TextField, Strings.hint_name);
Finder get comment => find.widgetWithText(TextField, Strings.hint_comment);
Finder get button => find.widgetWithText(RaisedButton, Strings.label_create);


class MockAPI extends Mock implements API {

  final bool errorMode;
  
  static String CREATED_MESSAGE = '{"message":"Mock - created."}';
  static String ERROR_MESSAGE = '{"message":"Mock - error."}';

  MockAPI({this.errorMode = false});
  
  Future<NetworkRequestResult> callAddUser(String name, String comment, {dynamic Function(String data) onSuccess, Function(NetworkRequestError) onError, String Function(String) converter}) {
    if (errorMode) {
      final error = NetworkRequestError(404, ERROR_MESSAGE);
      onError(error);
      return Future.value(NetworkRequestResult(error: error));
    }

    userStorage.add(User(name, comment));
    onSuccess(CREATED_MESSAGE);
    return Future.value(NetworkRequestResult(success: CREATED_MESSAGE));
  }
  
}