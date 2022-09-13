import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:social_support/models/main_problem.dart';
import 'package:social_support/models/main_tip.dart';
import '../../providers/custom_problems.dart';
import 'package:uuid/uuid.dart';

const randomID = Uuid();


class AddCustomProblemScreen extends StatelessWidget {
  static const String screenRoute = "/add-custom-problem-screen";

  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  String _problemText = "";
  String _tipText = "";

  void _submitForm(BuildContext context){
    _form.currentState!.save();
    CustomProblems customProblems = Provider.of<CustomProblems>(context, listen: false);
    MainTip newTip = MainTip(id: randomID.v4(), text: _tipText);
    MainProblem newProblem = MainProblem(id: randomID.v4(), text: _problemText, tips: [newTip]);
    customProblems.addProblem(newProblem);
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("הטיפ נוסף בהצלחה! תודה רבה!")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("הוספת טיפ"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 35.w),
        child: Form(
          key: _form,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "הוסיפי קושי חברתי וטיפים",
                  style: Theme.of(context).textTheme.headline2,
                ),
                SizedBox(height: 40.h),
                Text(
                  "קושי חברתי:",
                  style: Theme.of(context).textTheme.headline2,
                ),
                SizedBox(height: 10.h),
                TextFormField(
                  maxLength: 100,
                  onSaved: (String? value) {
                    _problemText = value!.trim();
                  },
                ),
                SizedBox(height: 42.h),
                Text(
                  "טיפ / דרך התמודדות:",
                  style: Theme.of(context).textTheme.headline2,
                ),
                SizedBox(height: 10.h),
                TextFormField(
                  maxLines: 5,
                  maxLength: 300,
                  onSaved: (String? value) {
                    _tipText = value!.trim();
                  },
                ),
                SizedBox(height: 50.h),
                ElevatedButton(onPressed: () => _submitForm(context), child: Text("שליחה"))

              ],
            ),
          ),
        ),
      ),
    );
  }
}
