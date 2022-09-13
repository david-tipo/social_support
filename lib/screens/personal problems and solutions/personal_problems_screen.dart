import 'package:flutter/material.dart';
import 'package:social_support/screens/personal%20problems%20and%20solutions/add_problem_page.dart';
import 'package:social_support/screens/personal%20problems%20and%20solutions/problems_page.dart';

class PersonalProblemsScreen extends StatefulWidget {

  static const String screenRoute = "/personal-problems-screen";

  @override
  State<PersonalProblemsScreen> createState() => _PersonalProblemsScreenState();
}

class _PersonalProblemsScreenState extends State<PersonalProblemsScreen> {

  /// Map that contains page and the title for each page
  final List<Map<String, dynamic>> _pagesData = [
    {'page': AddProblemPage(), 'title': 'שיתוף בקושי אישי'},
    {'page': ProblemsPage(), 'title': 'לעזור בקושי'},
  ];
  /// The index of which determine what page is selected
  int _selectedIndex = 0;
  /// Sets the page
  _selectPage(int index) {
    print("index: $index");
    setState(() {
      _selectedIndex = index;
    });
    print("selected index: $_selectedIndex");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pagesData[_selectedIndex]["title"],
        ),
      ),
      body: _pagesData[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedIndex,
        backgroundColor: Theme.of(context).accentColor,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "שיתוף קושי",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tune),
            label: "קשיים של תלמידים"
          ),
        ],
      ),
    );
  }
}
