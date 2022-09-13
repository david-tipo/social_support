import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_support/models/main_problem.dart';
import 'package:social_support/widgets/custom_tip_item.dart';

class CustomTipScreen extends StatelessWidget {
  static const String screenRoute = "/custom-tips-screen";


  @override
  Widget build(BuildContext context) {
    final MainProblem problem =
    ModalRoute.of(context)!.settings.arguments as MainProblem;
    return Scaffold(
      appBar: AppBar(
        title: Text("טיפים"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 35.h),
        child: Column(
          children: [
            Container(
              width: 290.w,
              height: 132.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: problem.color,
                // TODO: use linear gradient
              ),
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                child: FittedBox(
                  child: Text(
                    problem.text,
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(fontSize: 32.sp),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 44.h,
            ),
            Text(
              "טיפ / דרך התמודדות:",
              style: Theme.of(context).textTheme.headline3,
            ),
            SizedBox(
              height: 24.h,
            ),
            // tips list
            Expanded(
              child: ListView.separated(
                itemCount: problem.tips.length,
                itemBuilder: (BuildContext context, int index) => CustomTipItem(
                    problem.tips[index],
                    problem.id,
                    false
                ),
                separatorBuilder: (context, index) => (SizedBox(
                  height: 17.h,
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}