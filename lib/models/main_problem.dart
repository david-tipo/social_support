import 'main_tip.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class MainProblem {

  final String id;
  final String text;
  Color? _color;
  final List<MainTip> tips;

  MainProblem({
    required this.id,
    required this.text,
    required this.tips,
    Color? color
  }){
    if (color == null) // didnt get as a paremeter
      _color = Colors.primaries[Random().nextInt(Colors.primaries.length)];
    else {
      _color = color;
    }
  }

  void addTipLike(String id, String username) {
    tips.where((MainTip tip) => tip.id == id).first.addLike(username);
  }

  void removeTipLike(String id, String username) {
    tips.where((MainTip tip) => tip.id == id).first.removeLike(username);
  }

  Color get color {
    return _color!;
  }

  int get length {
    return tips.length;
  }


}