import 'package:bots_tdd/pages/MainPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('has bottom navigation bar', (WidgetTester tester) async {
    await tester.pumpWidget(MainPage());
    expect(find.byType(BottomNavigationBar), findsOneWidget);
  });


}