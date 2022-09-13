import 'package:flutter/material.dart';
import 'package:social_support/models/main_problem.dart';
import 'package:uuid/uuid.dart';

import '../models/main_tip.dart';

const randomID = Uuid();

class MainProblems with ChangeNotifier {
  
  final List<MainProblem> _problemsList = [
    MainProblem(id: randomID.v4(), text: "מכעיסים אותי", tips: [
      MainTip(id: randomID.v4(), text: "להתרחק",),
      MainTip(id: randomID.v4(), text: "לשתף מבוגר",),
      MainTip(id: randomID.v4(), text: "לדמיין מקום מרגיע",),
      MainTip(id: randomID.v4(), text: "להרפות את הגוף",),
    ]
    ),
    MainProblem(id: randomID.v4(), text: "רבים איתי", tips: [
      MainTip(id: randomID.v4(), text: "להתרחק מהמקום",),
      MainTip(id: randomID.v4(), text: "לנסות לדבר ולהבין מה הרצון שלה, נדבר על זה וכל אחת תביע את דעתה, וכך נכבד את הרצונות השונים",),
    ]
    ),
    MainProblem(id: randomID.v4(), text: "לא רוצים לשחק איתי", tips: [
      MainTip(id: randomID.v4(), text: "לחפש חברה בודדה ולשחק איתה",),
      MainTip(id: randomID.v4(), text: "לשחק משחק אחר",),
      MainTip(id: randomID.v4(), text: "אולי זה משחק שמתאים למספר אנשים מוגבל, ולכן הם לא משתפים, אל תקחי את זה אישי",),
      MainTip(id: randomID.v4(), text: "לשתף את המורה ואת ההורים",),
    ],
    ),
    MainProblem(id: randomID.v4(), text: "ילדה מכיתה גבוהה הציקה לי", tips: [
      MainTip(id: randomID.v4(), text: "להתרחק ממנה",),
      MainTip(id: randomID.v4(), text: "לשתף את המחנכת שלי/שלה",),
      MainTip(id: randomID.v4(), text: "לשתף את ההורים",),
    ],
    ),
    MainProblem(id: randomID.v4(), text: "מילים לא יפות", tips: [
      MainTip(id: randomID.v4(), text: "להתעלם",),
      MainTip(id: randomID.v4(), text: "להסביר שזה לא יפה",),
      MainTip(id: randomID.v4(), text: "לשתף מבוגר/מורה",),
    ],
    ),
    MainProblem(id: randomID.v4(), text: "החרימו אותי", tips: [
      MainTip(id: randomID.v4(), text: "לדבר ולשתף",),
    ],
    ),
    MainProblem(id: randomID.v4(), text: "אלימות פיזית", tips: [
      MainTip(id: randomID.v4(), text: "להתרחק מהמקום",),
      MainTip(id: randomID.v4(), text: "לשתף מבוגר",),
    ],
    ),
    MainProblem(id: randomID.v4(), text: "נעלבתי מחברה", tips: [
      MainTip(id: randomID.v4(), text: "להסביר לה שנפגעת",),
      MainTip(id: randomID.v4(), text: "לנהל שיח מיטבי",),
    ],
    ),
    MainProblem(id: randomID.v4(), text: "מעליבים אותי", tips: [
      MainTip(id: randomID.v4(), text: "תסבירי לילדה שלא נעים לך, פוגע בך",),
      MainTip(id: randomID.v4(), text: "אם זה ממשיך, תפני למורה או מחנכת",),
      MainTip(id: randomID.v4(), text: "להתעלם",),
    ],
    ),
    MainProblem(id: randomID.v4(), text: "חברה רוצה לשחק בקלפים ואני בכדור", tips: [
      MainTip(id: randomID.v4(), text: "נעשה אבן נייר ומספריים",),
      MainTip(id: randomID.v4(), text: "אשחק משחק אחר",),
      MainTip(id: randomID.v4(), text: "נחלק את זמן ההפסקה ל-2, נתחיל במשחק אחד ואחר כך בשני",),
      MainTip(id: randomID.v4(), text: "נוותר",),
      MainTip(id: randomID.v4(), text: "נחלק הפסקות",),
    ],
    ),
    MainProblem(id: randomID.v4(), text: "מחרימים ילדה בכיתה", tips: [
      MainTip(id: randomID.v4(), text: "לדבר איתה ולראות איך היא מרגישה",),
      MainTip(id: randomID.v4(), text: "לשתף את ההורים / מחנכת",),
      MainTip(id: randomID.v4(), text: "לדבר עם הכיתה ולמנוע את החרם",),

    ],
    ),
    MainProblem(id: randomID.v4(), text: " המורה הושיבה אותי ליד ילדה מבולגנת", tips: [
      MainTip(id: randomID.v4(), text: "תסבירי לה שזה מפריע לך",),
      MainTip(id: randomID.v4(), text: "תציעי לייסע ולעזור לה",),
    ],
    ),
    MainProblem(id: randomID.v4(), text: "לא קיבלו את הרעיון שלי", tips: [
      MainTip(id: randomID.v4(), text: "לצייר רעיון משלך",),
      MainTip(id: randomID.v4(), text: "לשתף עם מישהי שכן תקבל",),
    ],
    ),
    MainProblem(id: randomID.v4(), text: "כל החברות משחקות במשחק מסויים ולי כבר משעמם, בא לי משהו אחר", tips: [
      MainTip(id: randomID.v4(), text: "לחפש חבירות שאני בדרך כלל לא מדברת איתן ולפתח שיחה או לשחק ביחד. כך זה גם מרחיב את מעגל החבירות",),
    ],
    ),
    MainProblem(id: randomID.v4(), text: "לא יודעת להפסיד בכבוד/לא הוגנים", tips: [
      MainTip(id: randomID.v4(), text: "לקבוע כללים מראש",),
    ],
    ),

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

}