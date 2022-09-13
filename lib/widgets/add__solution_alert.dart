import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:social_support/models/personal_problem.dart';

import '../models/personal_solution.dart';
import '../providers/personal_problems.dart';

class AddSolutionAlert extends StatelessWidget {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final BuildContext context;
  final PersonalProblem currProblem;
  String _solution = "";

  AddSolutionAlert(this.context, this.currProblem);

  void _press(BuildContext context){
    bool isValid = _form.currentState!.validate();
    if (!isValid)
      return;

    PersonalProblems problems = Provider.of<PersonalProblems>(context, listen: false);
    _form.currentState!.save();
    // adds the user input as a solution to currProblem
    problems.addSolution(currProblem, PersonalSolution(_solution));
    print("added solution!");
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("תודה רבה על הוספת הטיפ!")));
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(" הוספת טיפ / דרך התמודדות"),
      alignment: Alignment.center,
      content: Container(
        height: 290.h,
        child: Form(
          key: _form,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  maxLength: 120,
                  maxLines: 5,
                  validator: (String? value) {
                    if (value == null || value.isEmpty)
                      return "אנא הזן טיפ";
                    if (value.length < 5)
                      return "טיפ קצר מדי. אנא פרט יותר";
                  },
                  onSaved: (String? value) {
                    _solution = value!;
                  },
                ),
                SizedBox(
                  height: 50.h,
                ),
                ElevatedButton(onPressed: () => _press(context), child: Text(
                  "הוספה",
                )),
                TextButton(onPressed: () {
                  Navigator.of(context).pop();
                }, child: Text("ביטול", style: TextStyle(color: Theme.of(context).primaryColor),))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
