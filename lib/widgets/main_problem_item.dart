import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_support/models/main_problem.dart';

class MainProblemItem extends StatelessWidget {

  final MainProblem problem;
  // gets screenRoute because it works both for MainProblem and
  // CustomProblem and each pushes different screen
  final String screenRoute;

  MainProblemItem(this.problem, this.screenRoute);

  void _tap(BuildContext context) {
    Navigator.of(context).pushNamed(this.screenRoute, arguments: problem);
  }


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _tap(context),
      splashColor: Theme.of(context).primaryColor,
      radius: 15,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 6.w),
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
