import 'package:bots_tdd/pages/CreatePage.dart';
import 'package:bots_tdd/resources/Strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  testWidgets('has two input fields with proper hints', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: CreatePage())));
    final name = find.widgetWithText(TextField, Strings.hint_name);
    final comment = find.widgetWithText(TextField, Strings.hint_comment);
    expect(name, findsOneWidget);
    expect(comment, findsOneWidget);
  });


}