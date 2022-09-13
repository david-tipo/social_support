import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_support/models/personal_solution.dart';

class PersonalSolutionItem extends StatelessWidget {

  final PersonalSolution solution;

  PersonalSolutionItem(this.solution);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text(
          solution.text,
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}
