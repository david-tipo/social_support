import 'package:flutter/material.dart';
import 'package:social_support/screens/class_report_screen.dart';
import 'package:social_support/screens/efrat_screen.dart';
import 'package:social_support/screens/rate_week_screen.dart';
import 'package:social_support/screens/students%20reports/students_list_screen.dart';
import 'package:social_support/screens/users%20problems%20and%20tips/custom_problems_screen.dart';
import 'models/page_category.dart';
import 'screens/main problems and tips/main_problems_screen.dart';
import 'screens/personal problems and solutions/personal_problems_screen.dart';

class DUMMY_DATA {

  static const List<PageCategory> _pageCategories =  [
    PageCategory(id: "2", color: Colors.green, title: "אשמח לקבל טיפ", screenRoute: EfratScreen.screenRoute), // TODO: change the screenRoute to real one
    PageCategory(id: "1", color: Colors.red, title: "מה מצבי השבוע", screenRoute: RateWeekScreen.screenRoute),
    PageCategory(id: "4", color: Colors.brown, title: "משתף בקושי שלי", screenRoute: PersonalProblemsScreen.screenRoute),
    PageCategory(id: "3", color: Colors.blue, title: "טיפים מהשטח", screenRoute: CustomProblemsScreen.screenRoute),
    PageCategory(id: "1", color: Colors.yellow, title: '"התחברתי"', screenRoute: "f"),
    // PageCategory(id: "5", color: Colors.purple, title: "לעזור בקשיים \n של אחרים", screenRoute: "e"),

  ];

  static const List<PageCategory> _teacherPageCategories = [
  PageCategory(id: "6", color: Colors.green, title: "דו\"ח כיתתי", screenRoute: ClassReportScreen.screenRoute), // TODO: change the screenRoute to real one
  PageCategory(id: "7", color: Colors.red, title: "דו\"ח תלמיד", screenRoute: StudentsScreen.screenRoute),
  ];

  static List<PageCategory> pageCategories (bool isTeacher){
    if (!isTeacher){ // normal student
      return _pageCategories;
    }
    // teacher
    List<PageCategory> combined = List.from(_pageCategories)..addAll(_teacherPageCategories);
    return combined;

  }

}