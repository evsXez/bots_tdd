import 'package:bots_tdd/resources/Strings.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: bottomNavigation,
      ),
    );
  }

  Widget get bottomNavigation => BottomNavigationBar(
    // onTap: pageSelected,
    fixedColor: Colors.deepOrange,
    unselectedItemColor: Colors.blue,
    // currentIndex: currentPageIdx,
    items: [
      BottomNavigationBarItem(icon: Icon(Icons.add), label: Strings.label_create),
      BottomNavigationBarItem(icon: Icon(Icons.list), label: Strings.label_read),
      BottomNavigationBarItem(icon: Icon(Icons.edit), label: Strings.label_update),
      BottomNavigationBarItem(icon: Icon(Icons.arrow_circle_down), label: Strings.label_stream),
    ]
  );

}