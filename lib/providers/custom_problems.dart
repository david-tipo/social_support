import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';
import '../models/main_problem.dart';
import '../models/main_tip.dart';

const randomID = Uuid();

class CustomProblems with ChangeNotifier {

  final List<MainProblem> _problemsList = [
    MainProblem(id: randomID.v4(), text: "לא מצליחה להתרכז בשיעור", tips: [
      MainTip(id: randomID.v4(), text: "לישון יותר ולעשות פעילות גופנית", likes: 26)
    ]),
    MainProblem(id: randomID.v4(), text: "החברות לא מקשיבות לי כשבוחרים מה לשחק", tips: [
      MainTip(id: randomID.v4(), text: "לדבר איתן ולהבין למה הן רוצות את המשחק שלהן ואז להציע את שלי", likes: 42),
    ]),
    MainProblem(id: randomID.v4(), text: "מרגישה שהמורה לא מתייחסת אלי ואל חברות כן", tips: [
      MainTip(id: randomID.v4(), text: "לנסות להיות מנומסת להיות קשובה כשצריך ופעילה. עם הזמן ההרגשה תחלוף", likes: 39),
    ]),
    MainProblem(id: randomID.v4(), text: "אף חברה לא מעניין אותה מה שאותי מעניין", tips: [
      MainTip(id: randomID.v4(), text: "להתעניין בתלמידות אחרות ולראות אם יש לכן תחומי עניין דומים", likes: 68),
    ]),
    MainProblem(id: randomID.v4(), text: "אני מקבלת ציונים גרועים יותר מחברות שלי", tips: [
      MainTip(id: randomID.v4(), text: "לפנות להורים ולשתף. היום יש לי מורה פרטית שעוזרת לי מאוד", likes: 51),
    ]),
  ];


  /// Gets a problemID, tipID and username, and adds like to the tip and the
  /// username to list of whoLiked
  void addLike(String problemID, tipID, String username) {
    _problemsList.where((MainProblem problem) => problem.id == problemID).first.addTipLike(tipID, username);
    notifyListeners();
  }

  /// Gets a problemID tipID and username, and removes one like from the tip
  /// and username from the list of whoLiked
  void removeLike(String problemID, tipID, String username) {
    _problemsList.where((MainProblem problem) => problem.id == problemID).first.removeTipLike(tipID, username);
    notifyListeners();
  }


  /// List<MainProblem> of all the main problems
  List<MainProblem> get problems {
    return [..._problemsList];
  }

  /// Gets a problem and adds it to problem list
  void addProblem(MainProblem problem){
    _problemsList.add(problem);
    notifyListeners();
  }


}