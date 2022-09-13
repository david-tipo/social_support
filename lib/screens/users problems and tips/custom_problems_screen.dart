import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../models/main_problem.dart';
import '../../providers/custom_problems.dart';
import '../../widgets/main_problem_item.dart';
import 'custom_tips_screen.dart';
import 'add_custom_problem_screen.dart';


class CustomProblemsScreen extends StatelessWidget {

  static const String screenRoute = "/custom-problem-screen";

  @override
  Widget build(BuildContext context) {
    CustomProblems problems = Provider.of<CustomProblems>(context);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(title: Text("בעיות וטיפים מהשטח"), centerTitle: true,),
      floatingActionButton: SizedBox(
        height: ScreenUtil().radius(70),
        width: ScreenUtil().radius(70),
        child: FloatingActionButton(
          child: Icon(Icons.add, size: ScreenUtil().radius(50),),
          onPressed: () {
            Navigator.of(context).pushNamed(AddCustomProblemScreen.screenRoute);
          },

        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 35.w),
        child: Column(
          children: [
            Text(
              "טיפים לבעיות מהשטח\n(ע\"י משתמשים)",
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
                children: problems.problems.map((MainProblem problem) => MainProblemItem(problem, CustomTipScreen.screenRoute)).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
