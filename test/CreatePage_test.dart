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
    await tester.pump();
    expect(find.text(MockAPI.CREATED_MESSAGE), findsOneWidget);
  });


}

List<User> userStorage;

Future<void> prepare(WidgetTester tester) async {
  widgetsSetUp();
  return tester.pumpWidget(MaterialApp(home: Scaffold(body: CreatePage(MockAPI()))));
}

void widgetsSetUp() {
  userStorage = [];
}

Finder get name => find.widgetWithText(TextField, Strings.hint_name);
Finder get comment => find.widgetWithText(TextField, Strings.hint_comment);
Finder get button => find.widgetWithText(RaisedButton, Strings.label_create);


class MockAPI extends Mock implements API {

  static String CREATED_MESSAGE = "Mock - created.";

  
  Future<NetworkRequestResult> callAddUser<T>(String name, String comment, {dynamic Function(T data) onSuccess, Function(NetworkRequestError) onError, T Function(String) converter}) {
    userStorage.add(User(name, comment));
    final res = '{"message":$CREATED_MESSAGE}';
    onSuccess(null);
    return Future.value(NetworkRequestResult(success: res));
  }
  
}