import 'package:flutter/material.dart';
import 'package:social_support/models/personal_problem.dart';
import 'package:social_support/screens/personal%20problems%20and%20solutions/personal_problem_details_screen.dart';

import '../models/personal_problem.dart';


class PersonalProblemItem extends StatelessWidget {

  final PersonalProblem problem;

  PersonalProblemItem(this.problem);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text(
          problem.title,
          style: Theme.of(context).textTheme.headline4,
        ),
        trailing: Icon(Icons.more_horiz),
        onTap: () => Navigator.of(context).pushNamed(PersonalProblemDetailsScreen.screenRoute, arguments: problem),
      ),
    );
  }
}
