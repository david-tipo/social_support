import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class ClassReportScreen extends StatelessWidget {

  static const String screenRoute = "/class-report-screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "דו\"ח כיתתי",
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 35.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20.h, width: double.infinity,),
              Text(
                "סה”כ כניסות תלמידים:",
                style: Theme.of(context).textTheme.headline2,
              ),
              SizedBox(
                height: 6.h,
              ),
              Text(
                "138",
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(color: Theme.of(context).primaryColor),
              ),
              SizedBox(
                height: 35.h,
              ),
              Text(
                "הקשיים שהכי הרבה\nהתמודדו איתם:",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline2,
              ),
              SizedBox(
                height: 6.h,
              ),
              Text(
                "מעליבים אותי, רבים איתי",
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(color: Theme.of(context).primaryColor),
              ),
              SizedBox(
                height: 35.h,
              ),
              Text(
                "טיפים בהם הכי השתמשו:",
                style: Theme.of(context).textTheme.headline2,
              ),
              SizedBox(
                height: 6.h,
              ),
              Text(
                "להתרחק, לשתף מבוגר",
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(color: Theme.of(context).primaryColor),
              ),
              SizedBox(
                height: 35.h,
              ),
              Text(
                "מצב חברתי השבוע:",
                style: Theme.of(context).textTheme.headline2,
              ),
              SizedBox(
                height: 6.h,
              ),


            ],
          ),
        ),
      ),
    );
  }
}
