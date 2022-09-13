import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_support/providers/personal_problems.dart';

import '../../widgets/personal_problem_item.dart';

class ProblemsPage extends StatelessWidget {
  const ProblemsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PersonalProblems personalProblems = Provider.of<PersonalProblems>(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 28.h, horizontal: 20.w) ,
      child: Column(
        children: [
          Text("עזור בקשיים של אחרים", style: Theme
              .of(context)
              .textTheme
              .headline2,),
          SizedBox(height: 35.h,),
          Expanded(
            child: ListView.builder(
              itemCount: personalProblems.problems.length,
              itemBuilder: (BuildContext context, int index) =>
                  PersonalProblemItem(personalProblems.problems[index]),
            ),
          ),
        ],
      ),
    );
  }
}
