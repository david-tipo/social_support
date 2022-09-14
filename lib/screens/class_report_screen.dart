import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:provider/provider.dart';

import '../providers/auth.dart';

class ClassReportScreen extends StatelessWidget {
  static const String screenRoute = "/class-report-screen";

  List<Series<int, String>> series(BuildContext context) {
    Auth auth = Provider.of<Auth>(context, listen: false);
    return [
      Series(
          id: "rating",
          data: [10, 9, 8, 7, 6, 5, 4, 3, 2, 1],
          domainFn: (int number, _) => number.toString(),
          measureFn: (int number, _) => auth.numOfStudentsByRate(number),
          colorFn: (int number, _) =>
              charts.ColorUtil.fromDartColor(Colors.pink)),
    ];
  }

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
              SizedBox(
                height: 20.h,
                width: double.infinity,
              ),
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
              Container(
                height: 200.h + 50,
                width: 300.w,
                child: BarChart(
                  series(context),
                  animate: true,
                ),
              ),
              SizedBox(height: 40.h,)
            ],
          ),
        ),
      ),
    );
  }
}
