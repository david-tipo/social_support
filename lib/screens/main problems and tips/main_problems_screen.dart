import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:social_support/screens/main%20problems%20and%20tips/main_tips_screen.dart';

import '../../models/main_problem.dart';
import '../../providers/main_problems.dart';
import '../../widgets/main_problem_item.dart';

class MainProblemsScreen extends StatelessWidget {

  static const String screenRoute = "/main-problems-screen";

  @override
  Widget build(BuildContext context) {
    MainProblems problems = Provider.of<MainProblems>(context);
    return Scaffold(
      appBar: AppBar(title: Text("קשיים"), centerTitle: true,),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 35.w),
        child: Column(
          children: [
            Text(
              "מה מאתגר אותך \n או קשה לך?",
              style: Theme.of(context).textTheme.headline2,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 40.h,
            ),
            Expanded(
              child: GridView(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: (100 + 35.w),
                  childAspectRatio: 3/2,
                  mainAxisSpacing: 24.h,
                  crossAxisSpacing: 20.w,
                ),
                children: problems.problems.map((MainProblem problem) => MainProblemItem(problem, MainTipsScreen.screenRoute)).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
