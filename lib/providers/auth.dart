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
        mostUsedTips: ["להתרחק, לשתף מבוגר"], weekRate: 8,
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
    Map<String, dynamic> currUser = users.where((Map<String, dynamic> user) => user["username"] == username).first;
    if (currUser["password"] != password){ // worng password
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
    for (Map<String, dynamic> user in users){
      if (user["username"] == username){
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
    var students = users.where((Map<String, dynamic> user) => !user["isTeacher"]);
    return students.toList();
  }


  /// returns user by thier username
  Map<String, dynamic> getByUsername(String username) {
    return users.where((Map<String, dynamic> user) => user["username"] == username).first;
  }



}