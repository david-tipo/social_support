import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:social_support/models/student_report.dart';

import '../../providers/auth.dart';

class StudentReportScreen extends StatelessWidget {
  static const String screenRoute = "/student-report-screen";

  @override
  Widget build(BuildContext context) {
    String username = ModalRoute.of(context)!.settings.arguments as String;
    Auth auth = Provider.of<Auth>(context);
    final StudentReport studentReport = auth.getByUsername(username)["report"];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "דו\"ח תלמיד",
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                "שם:",
                style: Theme.of(context).textTheme.headline2,
              ),
              SizedBox(
                height: 6.h,
              ),
              Text(
                username,
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(color: Theme.of(context).primaryColor),
              ),
              SizedBox(
                height: 35.h,
              ),
              Text(
                "מספר כניסות:",
                style: Theme.of(context).textTheme.headline2,
              ),
              SizedBox(
                height: 6.h,
              ),
              Text(
                studentReport.enterAmount.toString(),
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(color: Theme.of(context).primaryColor),
              ),
              SizedBox(
                height: 35.h,
              ),
              Text(
                "הקשיים איתם מתמודד:",
                style: Theme.of(context).textTheme.headline2,
              ),
              SizedBox(
                height: 6.h,
              ),
              Text(
                studentReport.stringProblems,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(color: Theme.of(context).primaryColor),
              ),
              SizedBox(
                height: 35.h,
              ),
              Text(
                "הטיפים בו השתמש:",
                style: Theme.of(context).textTheme.headline2,
              ),
              SizedBox(
                height: 6.h,
              ),
              Text(
                studentReport.stringTips,
                textAlign: TextAlign.center,
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
              Text(
                studentReport.weekRate.toString(),
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(color: Theme.of(context).primaryColor),
              ),
              SizedBox(height: 30.h)
            ],
          ),
        ),
      ),
    );
  }
}
