import 'package:flutter/material.dart';
import 'package:social_support/models/personal_solution.dart';
import '../models/personal_problem.dart';
import 'package:uuid/uuid.dart';

const randomID = Uuid();


class PersonalProblems with ChangeNotifier {

  List<PersonalProblem> problems = [
    PersonalProblem(id: randomID.v4(), title: "מתוסכלת שאני פחות מוכשרת מחברות שלי", details: "הן יותר טובות ממני בהכל. אני מרגישה כאילו אני כשלון ושאני לא טובה בכלום. זה ממש מעצבן", solutions: [PersonalSolution("בטוח יש דבר שאת גם טובה בו. לכל אחת יש. נסי לראות במה את מוצלחת"), PersonalSolution("תנסי להיות גאה במי שאת. גם אם קשה לך לראות את זה, יש בך את הדברים המיוחדים שלך"), PersonalSolution("אני בטוחה שאת אלופה ומוכשרת. יכול להיות שהן סתם מקנאות")]),
    PersonalProblem(id: randomID.v4(), title: "לא כיף לי ללכת לבית הספר", details: "כל בוקר כשאני מתעוררת אני מרגישה באסה שאני צריכה ללכת לבית ספר. לא כיף לי עם כל המבחנים והתחרותיות שיש בכיתה. אני לא יודעת מה לעשות"),
    PersonalProblem(id: randomID.v4(), title: "אין לי חברות", details: "אין לי חברות להיות איתם, בהפסקה אף אחת לא רוצה לשחק או לדבר איתי ואני כבר מתביישת להציע. איך אני גורמת לזה שירצו להיות חברה שלי?"),
    PersonalProblem(id: randomID.v4(), title: "הייתי רוצה להצליח יותר במטלות ומבחנים", details: "יש לי חברה גאונה שלה הכל נראה שבא בקלות ולי גם בא שהכל ילך בקלות. אבל אני לא טובה כמוה במקצועות השונים. מה לעשות?"),
  ];

  /// add given problem to problems
  void addProblem(PersonalProblem problem){
    problems.add(problem);
    notifyListeners();
  }

  /// adds given solution to given problem
  void addSolution(PersonalProblem problem, PersonalSolution solution){
    problem.addSolution(solution);
    notifyListeners();
  }

}