import 'package:bots_tdd/pages/CreatePage.dart';
import 'package:bots_tdd/resources/Strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  testWidgets('has two input fields with proper hints', (WidgetTester tester) async {
    await prepare(tester);
    expect(name, findsOneWidget);
    expect(comment, findsOneWidget);
  });

  testWidgets('button CREATE tap saves the data', (WidgetTester tester) async {
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


}

Future<void> prepare(WidgetTester tester) => tester.pumpWidget(MaterialApp(home: Scaffold(body: CreatePage())));


Finder get name => find.widgetWithText(TextField, Strings.hint_name);
Finder get comment => find.widgetWithText(TextField, Strings.hint_comment);
Finder get button => find.widgetWithText(RaisedButton, Strings.label_create);