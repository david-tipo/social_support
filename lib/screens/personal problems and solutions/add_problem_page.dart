import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:social_support/models/personal_problem.dart';
import 'package:uuid/uuid.dart';
import '../../providers/personal_problems.dart';

const randomID = Uuid();


class AddProblemPage extends StatelessWidget {

  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  String _title = "";
  String _body = "";

  void _submitForm(BuildContext context) {
    _form.currentState!.save();
    PersonalProblems personalProblems = Provider.of<PersonalProblems>(
        context, listen: false);
    PersonalProblem newProblem = PersonalProblem(
        id: randomID.v4(), title: _title, details: _body);
    personalProblems.addProblem(newProblem);
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("הקושי נוסף בהצלחה!")));
    print("added problems!!");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 28.h, horizontal: 50.w
      ),
      child: Form(
        key: _form,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(width: double.infinity,), // to center all column
              Text("שיתוף בקושי חברתי אישי", style: Theme
                  .of(context)
                  .textTheme
                  .headline2,
              textAlign: TextAlign.center,),
              SizedBox(height: 35.h,),
              Text("כותרת", style: Theme
                  .of(context)
                  .textTheme
                  .headline3,),
              SizedBox(height: 14.h,),
              TextFormField(
                onSaved: (String? value) {
                  _title = value!;
                },
              ),
              SizedBox(height: 20.h,),
              Text("תיאור הקושי", style: Theme
                  .of(context)
                  .textTheme
                  .headline3,),
              SizedBox(height: 14.h,),
              TextFormField(
                maxLines: 5,
                onSaved: (String? value) {
                  _body = value!;
                },
              ),
              SizedBox(height: 45.h),
              ElevatedButton(onPressed: () => _submitForm(context), child: Container(
                alignment: Alignment.center,
                height: 50.h,
                width: 100.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "שליחה",
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline4,
                ),
              ),

              )
            ],
          ),
        ),
      ),
    );
  }
}
