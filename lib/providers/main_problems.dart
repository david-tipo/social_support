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
    MainProblem(id: randomID.v4(), text: "בשעות אחר הצהריים, מתביישת ליצור קשר עם חברות", tips: [
      MainTip(id: randomID.v4(), text: "לחפש את החברה הכי עדינה בכיתה, שאת פחות מתביישת ליצור איתה קשר, ולשוחח איתה בטלפון",),
      MainTip(id: randomID.v4(), text: "לחפש את החברה הכי עדינה בכיתה, שאת פחות מתביישת ליצור איתה קשר, ולהזמין אותה אלייך הביתה לשעה אחת בלבד",),
      MainTip(id: randomID.v4(), text: "להצטרף לקבוצות נוער. לאט לאט תכירי חברות",),
    ],
    ),
    MainProblem(id: randomID.v4(), text: "בדידות אחר הצהריים", tips: [
      MainTip(id: randomID.v4(), text: "לברר מראש איזה משחקים אוהבים לשחק בכיתה ואז להזמין חברה בודדה אחרת ולשחק איתה במשחקים הללו",),
      MainTip(id: randomID.v4(), text: "להזמין חברה או שתיים ולתכנן מראש את המפגש. לדוגמה – המפגש יהיה קצר! לא יותר משעה! משעה 5:00-5:30 משחקים במשחק/ים אהוב/ים. משעה 5:30-5:40 מכינים ביחד משקה/מאכל טעים ומתפנקים. משעה 5:40-6:00 משחקים משחק נוסף. אפשר גם לשלב במקום משחק – לאפות יחד/לבשל ביחד. בנים – לבנות משהו בנגרות.. חשוב שהמפגש יהיה מתוכנן מראש וכל הציוד יהיה מוכן",),
      MainTip(id: randomID.v4(), text: "להשתתף בתנועת נוער. שם תכירי חברות רבות ותפיגי את הבדידות",),
    ],
    ),
    MainProblem(id: randomID.v4(), text: "שיימינג ברשת אחה\"צ", tips: [
      MainTip(id: randomID.v4(), text: "לשתף מורים/מורה/מחנך/מנהל/יועצת",),
      MainTip(id: randomID.v4(), text: "להציע למורה לפתח בכיתה 'סיירת חברות' הסיירת תהיה שותפה לקבוצות הוואטסאפ הכיתתית ותהיה אחראית לסייע ביצירת קשרים חברתיים ובגישור",),
      MainTip(id: randomID.v4(), text: "לצאת מהקבוצה!",),
      MainTip(id: randomID.v4(), text: "4. תמיד תזכירי לעצמך שאת מהממת! יש לך תכונות נפלאות וכוחות מיוחדים ואף אחד לא יוריד לך את הביטחון!",),
    ],
    ),
    MainProblem(id: randomID.v4(), text: "בדידות / שעמום בביה\"ס", tips: [
      MainTip(id: randomID.v4(), text: "להכין דוכן משחקים שיתאים דווקא לשכבת הגיל שלך ולהפעיל אותו בהפסקות",),
      MainTip(id: randomID.v4(), text: "להכין דוכן משחקים שיתאים לכיתות הנמוכות ולהפעיל את הבנות",),
      MainTip(id: randomID.v4(), text: "להציע לחברות בודדות מהכיתה לסייע לך להפעיל את הדוכן. *אפשר שיהיה כרטיסיות לבנות שמשתתפות בדוכן וכל מי שמסיימת את הניקובים בכרטיס תקבל פרס.",),

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
      MainTip(id: randomID.v4(), text: "לחפש חברות שאני בדרך כלל לא מדברת איתן ולפתח שיחה או לשחק ביחד. כך זה גם מרחיב את מעגל החברות",),
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