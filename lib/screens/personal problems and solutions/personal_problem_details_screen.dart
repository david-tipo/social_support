import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:social_support/models/personal_problem.dart';
import 'package:social_support/widgets/add__solution_alert.dart';
import 'package:social_support/widgets/personal_solution_item.dart';

import '../../providers/personal_problems.dart';

class PersonalProblemDetailsScreen extends StatelessWidget {
  const PersonalProblemDetailsScreen({Key? key}) : super(key: key);

  static const String screenRoute = "/personal-problem-details-screen";

  void _pressedAdd(BuildContext context, PersonalProblem problem) {
    showDialog(context: context, builder: (context) => AddSolutionAlert(context, problem));
  }


  @override
  Widget build(BuildContext context) {
    final PersonalProblem personalProblem =
        ModalRoute.of(context)!.settings.arguments as PersonalProblem;
    // the provider is set here only to listen to changes.
    PersonalProblems personalProblems = Provider.of<PersonalProblems>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("תיאור הקושי החברתי"),
        centerTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: SizedBox(
        height: ScreenUtil().radius(70),
        width: ScreenUtil().radius(70),
        child: FloatingActionButton(
          child: Icon(Icons.add, size: ScreenUtil().radius(50),),
          onPressed: () => _pressedAdd(context, personalProblem)
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 28.h, horizontal: 35.w),
        child: Column(
          children: [
            const SizedBox(
              width: double.infinity,
            ), // to center all column

            Text(
              personalProblem.title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(height: 15.h,),
            Text(personalProblem.details, style: TextStyle(fontSize: 16.sp),),
            SizedBox(
              height: 80.h,
            ),
            Text(
              "טיפים:",
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: ListView.separated(
                itemCount: personalProblem.solutions.length,
                itemBuilder: (BuildContext context, int index) =>
                    PersonalSolutionItem(
                  personalProblem.solutions[index],
                ),
                separatorBuilder: (context, index) => (SizedBox(height: 13.h)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
