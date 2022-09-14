import 'package:flutter/material.dart';
import 'package:social_support/models/student_report.dart';

class Auth with ChangeNotifier {
  bool isLoggedIn = false;
  bool isTeacher = false;
  String? username;

  /// The list of users
  List<Map<String, dynamic>> users = [
    {
      "username": "test",
      "password": "1234",
      "isTeacher": true,
    },
    {
      "username": "רחלי",
      "password": "1234",
      "isTeacher": true,
    },
    {
      "username": "שרית",
      "password": "1234",
      "isTeacher": false,
      "report": StudentReport(
        enterAmount: 24,
        mostUsedProblems: ["מעליבים אותי, רבים איתי"],
        mostUsedTips: ["להתרחק, לשתף מבוגר"], weekRate: 6,
      ),
    },
    {
      "username": "מעיין",
      "password": "1234",
      "isTeacher": false,
      "report": StudentReport(
        enterAmount: 18,
        mostUsedProblems: ["מעליבים אותי, רבים איתי"],
        mostUsedTips: ["להתרחק, לשתף מבוגר"], weekRate: 7,
      ),
    },
    {
      "username": "אפרת",
      "password": "1234",
      "isTeacher": false,
      "report": StudentReport(
        enterAmount: 21,
        mostUsedProblems: ["נעלבתי מחברה , מכעיסים אותי"],
        mostUsedTips: ["להסביר שזה לא יפה, לשתף מבוגר"], weekRate: 9,
      ),
    },
    {
      "username": "נעמי",
      "password": "1234",
      "isTeacher": false,
      "report": StudentReport(
        enterAmount: 46,
        mostUsedProblems: ["לא רוצים לשחק איתי , בדידות אחר הצהריים"],
        mostUsedTips: ["לשתף את המורה וההורים, לחפש חברה בודדה ולשחק איתה"],
        weekRate: 6,
      ),
    },
    {
      "username": "עדן",
      "password": "1234",
      "isTeacher": false,
      "report": StudentReport(
        enterAmount: 32,
        mostUsedProblems: ["לא רוצים לשחק איתי , מילים לא יפות"],
        mostUsedTips: ["לנהל שיח מיטבי, להצטרף לקבוצת נוער"], weekRate: 8,
      ),
    },
    {
      "username": "מרים",
      "password": "1234",
      "isTeacher": false,
      "report": StudentReport(
        enterAmount: 42,
        mostUsedProblems: ["לא רוצים לשחק איתי , החרימו אותי"],
        mostUsedTips: ["לדבר ולשתף, להסביר שזה לא יפה"], weekRate: 4,
      ),
    },
    {
      "username": "נועה",
      "password": "1234",
      "isTeacher": false,
      "report": StudentReport(
        enterAmount: 23,
        mostUsedProblems: ["ילדה מכיתה גבוהה הציקה לי , מכעיסים אותי"],
        mostUsedTips: ["להתרחק מהמקום, לדמיין מקום מרגיע"], weekRate: 7,
      ),
    },


  ];

  /// gets a String username and password.
  /// then logs the user to the system
  /// return true if user logged successfully
  bool login(String username, String password) {
    print("username $username exists: ${doesExist(username)}");
    if (!doesExist(username)) { // username doesn't exist
      print("שם משתמש שגוייה");
      return false;
    }
    Map<String, dynamic> currUser = users
        .where((Map<String, dynamic> user) => user["username"] == username)
        .first;
    if (currUser["password"] != password) { // worng password
      print("סיסמא שגוייה");
      return false;
    }
    isLoggedIn = true;
    isTeacher = currUser["isTeacher"];
    this.username = username;
    print("successes! user: ${currUser["username"]} is teacher: $isTeacher");
    return true;
  }


  /// gets a String username and returns true if he is in users
  bool doesExist(String username) {
    for (Map<String, dynamic> user in users) {
      if (user["username"] == username) {
        return true;
      }
    }
    return false;
  }

  /// logs any logged user out.
  void logout() {
    isLoggedIn = false;
    isTeacher = false;
    username = null;
  }

  /// returns a list of only students, not teachers
  /// each student is Map<String, dynamic>
  List<Map<String, dynamic>> get students {
    var students = users.where((
        Map<String, dynamic> user) => !user["isTeacher"]);
    return students.toList();
  }


  /// returns user by thier username
  Map<String, dynamic> getByUsername(String username) {
    return users
        .where((Map<String, dynamic> user) => user["username"] == username)
        .first;
  }

  /// gets a int rating and returns the amount of students that has that rating
  int numOfStudentsByRate(int rating) {
    int count = 0;
    students.forEach((Map<String, dynamic> student) {
      int currRate = (student["report"] as StudentReport).weekRate;
      if (currRate == rating)
        count ++;
    });
    return count;
  }

}