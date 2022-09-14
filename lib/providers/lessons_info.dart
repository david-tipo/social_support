import 'package:flutter/material.dart';

import '../models/lesson_info.dart';

class LessonsInfo with ChangeNotifier {

  List<LessonInfo> lessons = [
    LessonInfo(
      title: "העלאת מודעות לחרם",
      details: "היה שיעור מרתק שבו הוסבר לתלמידים על נושא החרם וכמה הוא פוגעני, בנוסף כל תלמיד ותלמידה שיתפו את המחשבות שלהם בנושא"
      ,username: "רחלי",
      imageUrl: "https://www.collaborativeclassroom.org/app/uploads/2022/04/Lodi-USD-using-SIPPS-760x480-c-default.png"
    )
  ];


  /// gets a lesson and adds it to lessons
  void addLesson(LessonInfo lesson){
    lessons.add(lesson);
    notifyListeners();
  }

  /// gets a lesson and removes it from lessons
  void removeLesson(LessonInfo lesson){
    lessons.remove(lesson);
    notifyListeners();
  }


}