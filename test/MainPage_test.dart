import 'package:bots_tdd/pages/CreatePage.dart';
import 'package:bots_tdd/pages/MainPage.dart';
import 'package:bots_tdd/pages/ReadPage.dart';
import 'package:bots_tdd/pages/UpdatePage.dart';
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

    testWidgets('tap on 2nd button shows ReadPage', (WidgetTester tester) async {
      await tester.pumpWidget(MainPage());

      await tester.tap(find.byIcon(Icons.list));
      await tester.pump();
      expect(find.byType(ReadPage), findsOneWidget);
      expect(find.byType(CreatePage), findsNothing);
    });

    testWidgets('tap on 3rd button shows UpdatePage', (WidgetTester tester) async {
      await tester.pumpWidget(MainPage());

      await tester.tap(find.byIcon(Icons.edit));
      await tester.pump();
      expect(find.byType(UpdatePage), findsOneWidget);
      expect(find.byType(CreatePage), findsNothing);
    });

  });


}