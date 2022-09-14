import 'package:flutter/cupertino.dart';
import 'package:social_support/models/take_for_life.dart';

class TakesForLifeProvider with ChangeNotifier{

  List<TakeForLife> items = [
    TakeForLife(title: "יותר רגישה כלפי חברות בכיתה", username: "שרית", details: "פעם הייתי פחות רגישה כלפי חברות בכיתה שלי והרבה פעם היו נעלבות מדברים פוגעניים שאמרתי להם, לפעמים בטעות. אחרי שראיתי כמה זה פוגע בבנות שמעלות קשיים ויחד עם שיעורי התחברתי הפנמתי יותר את עניין הרגישות כלפי הזולת",),
  ];

  /// gets a TakeForLife and adds it to lessons
  void addItem(TakeForLife take){
    items.add(take);
    notifyListeners();
  }

  /// gets a TakeForLife and removes it from lessons
  void removeItem(TakeForLife take){
    items.remove(take);
    notifyListeners();
  }

}