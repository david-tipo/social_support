import 'package:flutter/material.dart';
import 'package:social_support/screens/class_report_screen.dart';
import 'package:social_support/screens/efrat_screen.dart';
import 'package:social_support/screens/lessons%20(connected)/connected_screen.dart';
import 'package:social_support/screens/rate_week_screen.dart';
import 'package:social_support/screens/students%20reports/students_list_screen.dart';
import 'package:social_support/screens/users%20problems%20and%20tips/custom_problems_screen.dart';
import 'models/page_category.dart';
import 'screens/main problems and tips/main_problems_screen.dart';
import 'screens/personal problems and solutions/personal_problems_screen.dart';

class DUMMY_DATA {

  static const List<PageCategory> _studentCategories = [
    PageCategory(id: "1", color: Colors.red, title: "מה מצבי השבוע", screenRoute: RateWeekScreen.screenRoute),
  ];

  static const List<PageCategory> _pageCategories =  [
    PageCategory(id: "2", color: Colors.green, title: "אשמח לקבל טיפ", screenRoute: EfratScreen.screenRoute), // TODO: change the screenRoute to real one
    PageCategory(id: "4", color: Colors.pink, title: "משתף בקושי שלי", screenRoute: PersonalProblemsScreen.screenRoute),
    PageCategory(id: "3", color: Colors.blue, title: "טיפים מהשטח", screenRoute: CustomProblemsScreen.screenRoute),
    PageCategory(id: "8", color: Colors.yellow, title: '"התחברתי"', screenRoute: ConnectedScreen.screenRoute),
    // PageCategory(id: "5", color: Colors.purple, title: "לעזור בקשיים \n של אחרים", screenRoute: "e"),

  ];

  static const List<PageCategory> _teacherPageCategories = [
  PageCategory(id: "6", color: Colors.tealAccent, title: "דו\"ח כיתתי", screenRoute: ClassReportScreen.screenRoute), // TODO: change the screenRoute to real one
  PageCategory(id: "7", color: Colors.red, title: "דו\"ח תלמיד", screenRoute: StudentsScreen.screenRoute),
  ];

  static List<PageCategory> pageCategories (bool isTeacher){
    if (!isTeacher){ // normal student
      List<PageCategory> combined = List.from(_pageCategories)..addAll(_studentCategories);
      return combined;
    }
    // teacher
    List<PageCategory> combined = List.from(_pageCategories)..addAll(_teacherPageCategories);
    return combined;

  }

  /// Gets a String and returns the String with automatic
  /// line increment \n when needed
  static String addLines(String text){

    var sliptedStr = text.split(' ');
    String newStr = "";
    int currentRowCount = 0;

    for (int i = 0; i < sliptedStr.length; i++){
      currentRowCount += sliptedStr[i].length;
      newStr += sliptedStr[i];
      if (currentRowCount >= 15){
        newStr += "\n";
        currentRowCount = 0;
      }
      newStr += " ";
    }
    return newStr.trim();
  }

}