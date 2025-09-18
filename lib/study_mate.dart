import 'package:flutter/material.dart';
import 'package:p1/calender.dart';
import 'package:p1/home.dart';
import 'package:p1/nav_bar.dart';
import 'package:p1/profile.dart';

class StudyMate extends StatefulWidget {
  const StudyMate({super.key});

  @override
  State<StatefulWidget> createState() => _StudyMateState();
}

class _StudyMateState extends State<StudyMate> {
  int _currentIndex = 0;
  final List<Widget> _pages = const [Home(), Calender(), Profile()];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: IndexedStack(index: _currentIndex, children: _pages),
        bottomNavigationBar: NavBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
