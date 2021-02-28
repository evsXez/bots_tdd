import 'package:bots_tdd/pages/CreatePage.dart';
import 'package:bots_tdd/pages/MainPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {



  group('navigation bar', () {

    testWidgets('has bottom navigation bar', (WidgetTester tester) async {
      await tester.pumpWidget(MainPage());
      expect(find.byType(BottomNavigationBar), findsOneWidget);
    });

    testWidgets('has 4 page icons', (WidgetTester tester) async {
      await tester.pumpWidget(MainPage());
      expect(find.byType(Icon), findsNWidgets(4));
    });

    testWidgets('initially shows CreatePage', (WidgetTester tester) async {
      await tester.pumpWidget(MainPage());
      expect(find.byType(CreatePage), findsOneWidget);
    });

    testWidgets('tap on second button shows ReadPage', (WidgetTester tester) async {
      await tester.pumpWidget(MainPage());

      await tester.tap(find.byIcon(Icons.list));
      expect(find.byType(ReadPage), findsOneWidget);
      expect(find.byType(CreatePage), findsNothing);
    });

  });


}