import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_support/models/main_problem.dart';
import 'package:social_support/screens/main%20problems%20and%20tips/main_tips_screen.dart';


class CustomProblemItem extends StatelessWidget {

  final MainProblem problem;

  CustomProblemItem(this.problem);

  void _tap(BuildContext context) {
    Navigator.of(context).pushNamed(MainTipsScreen.screenRoute, arguments: problem);
  }


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _tap(context),
      splashColor: Theme.of(context).primaryColor,
      radius: 15,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              problem.color.withOpacity(0.7),
              problem.color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(problem.text, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
      ),
    );
  }
}
