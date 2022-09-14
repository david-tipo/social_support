import 'package:flutter/material.dart';
import '../models/improved_in.dart';

class ImprovedInProvider with ChangeNotifier {

  List<ImprovedIn> items = [
    ImprovedIn(title: "קבלת השונה בכיתה", username: "רחלי", details: "כיתתנו ראתה שיפור משמעותי מאז ישום האפליקצייה בכיתתנו. תלמידים למדו יותר לכבד אחד את השני ולקבל את כלל התלמידים",)
  ];


  /// gets a improvement and adds it to lessons
  void addItem(ImprovedIn improvement){
    items.add(improvement);
    notifyListeners();
  }

  /// gets a improvement and removes it from lessons
  void removeItem(ImprovedIn improvement){
    items.remove(improvement);
    notifyListeners();
  }


}