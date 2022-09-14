import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:social_support/models/improved_in.dart';

class ImprovementDetailsScreen extends StatelessWidget {
  const ImprovementDetailsScreen({Key? key}) : super(key: key);

  static const String screenRoute = "/improvement-details-screen";

  @override
  Widget build(BuildContext context) {
    final ImprovedIn improvement =
    ModalRoute
        .of(context)!
        .settings
        .arguments as ImprovedIn;
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
                improvement.title,
                textAlign: TextAlign.center,
                style: Theme
                    .of(context)
                    .textTheme
                    .headline2,
              ),
              // Divider(
              //   height: 50.h,
              //   thickness: 3.h,
              //   color: Theme.of(context).accentColor,
              // ),
              SizedBox(height: 50.h),

              Text(
                "תיאור:",
                style: Theme
                    .of(context)
                    .textTheme
                    .headline3,
              ),
              SizedBox(height: 10.h),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(ScreenUtil().radius(20))),
                child: Padding(
                  padding: EdgeInsets.all(20.w),
                  child: Text(
                    improvement.details,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16.sp),
                  ),
                ),
              ),
              SizedBox(height: 30.h),
              if (improvement.imageUrl != null) ...[
                Text(
                  "תמונה / סרטון:",
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline3,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Image.network(improvement.imageUrl!)
              ]
            ],
          ),
        ),
      ),
    );
  }
}
