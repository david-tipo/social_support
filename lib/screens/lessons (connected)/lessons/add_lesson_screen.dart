import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_support/models/lesson_info.dart';

import '../../../providers/auth.dart';
import '../../../providers/lessons_info.dart';

class AddLessonScreen extends StatelessWidget {

  static const String screenRoute = "/add-lesson-screen";

  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  String _title = "";
  String _body = "";


  String? _myValidator(String? value) {
    if (value == null || value.isEmpty){
      return "אנא הזן ערך";
    }
    if (value.length < 5){
      return "ערך קצר מדי, אנא פרט/י יותר";
    }
  }

  void _submitForm(BuildContext context) {
    bool isValid = _form.currentState!.validate();
    if (!isValid){
      return;
    }
    _form.currentState!.save();
    Auth auth = Provider.of<Auth>(context, listen: false);
    LessonsInfo lessonsInfo = Provider.of<LessonsInfo>(context, listen: false);
    LessonInfo newLesson = LessonInfo(title: _title, username: auth.username!, details: _body);
    lessonsInfo.addLesson(newLesson);
    print("added lesso!");
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("תיעוד השיעור שותף בהצלחה!")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("הוספת תיעוד שיעור"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 35.w),
        child: Form(
          key: _form,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 28.h, width: double.infinity,),
                Text("הוספת תיעוד שיעור", style: Theme.of(context).textTheme.headline2, textAlign: TextAlign.center,),
                SizedBox(height: 40.h),
                Text(
                  "כותרת:",
                  style: Theme.of(context).textTheme.headline3,
                ),
                SizedBox(height: 10.h),
                TextFormField(
                  maxLength: 100,
                  validator: _myValidator,
                  onSaved: (String? value) {
                    _title = value!.trim();
                  },
                ),
                SizedBox(height: 42.h),
                Text(
                  "תוכן השיעור:",
                  style: Theme.of(context).textTheme.headline3,
                ),
                SizedBox(height: 10.h),
                TextFormField(
                  maxLines: 5,
                  maxLength: 300,
                  validator: _myValidator,
                  onSaved: (String? value) {
                    _body = value!.trim();
                  },
                ),
                SizedBox(height: 42.h),
                Text(
                  "העלאת תמונה / סרטון:",
                  style: Theme.of(context).textTheme.headline3,
                ),
                Text("* לא זמין כרגע", style: Theme.of(context).textTheme.subtitle1,),

                SizedBox(height: 10.h),
                Image.asset("assets/upload_image.png"),

                SizedBox(height: 50.h),

                ElevatedButton(onPressed: () => _submitForm(context), child: Text("שליחה"))
                ,SizedBox(height: 20.h),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
