import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:social_support/widgets/student_card.dart';

import '../../providers/auth.dart';

class StudentsScreen extends StatelessWidget {

  static const String screenRoute = "/students-screen";

  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of<Auth>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "רשימת תלמידים",
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 35.w),
        child: Column(
          children: [
            Text(
              "דו\"ח מסכם על התלמידים",
              style: Theme
                  .of(context)
                  .textTheme
                  .headline2,
            ),
            SizedBox(
              height: 49.h,
            ),
            Expanded(
                child: ListView.separated(
                    itemBuilder: (BuildContext context, int index) {
                      print("student name: ${auth.students[index]["username"]}");
                      print("student report ${auth.students[index]["report"]}");
                      return StudentCard(auth.students[index]["username"], auth.students[index]["report"]);
                    },
                    separatorBuilder: (context, index) =>
                    (SizedBox(height: 16.h)),
                    itemCount: auth.students.length))
          ],
        ),
      ),
    );
  }
}
