import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_support/models/lesson_info.dart';

class LessonDetailsScreen extends StatelessWidget {
  const LessonDetailsScreen({Key? key}) : super(key: key);

  static const String screenRoute = "/lesson-details-screen";

  @override
  Widget build(BuildContext context) {
    final LessonInfo lesson =
        ModalRoute.of(context)!.settings.arguments as LessonInfo;
    return Scaffold(
      appBar: AppBar(
        title: Text("תיאור שיעור"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 35.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 28.h,
                width: double.infinity,
              ),
              Text(
                lesson.title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline2,
              ),
              // Divider(
              //   height: 50.h,
              //   thickness: 3.h,
              //   color: Theme.of(context).accentColor,
              // ),
              SizedBox(height: 50.h),

              Text(
                "תיאור:",
                style: Theme.of(context).textTheme.headline3,
              ),
              SizedBox(height: 10.h),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(ScreenUtil().radius(20))),
                child: Padding(
                  padding: EdgeInsets.all(20.w),
                  child: Text(
                    lesson.details,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16.sp),
                  ),
                ),
              ),
              SizedBox(height: 30.h),
              if (lesson.imageUrl != null) ...[
                Text(
                  "תמונה / סרטון:",
                  style: Theme.of(context).textTheme.headline3,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Image.asset(lesson.imageUrl!)
              ]
            ],
          ),
        ),
      ),
    );
  }
}
