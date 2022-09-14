import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_support/models/student_report.dart';

import '../screens/students reports/student_report_screen.dart';

class StudentCard extends StatelessWidget {


  final String name;
  final StudentReport report;

  StudentCard(this.name, this.report);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Center(
          child: Text(
            name,
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
        onTap: () {
          Navigator.of(context).pushNamed(StudentReportScreen.screenRoute, arguments: name);
        },
        trailing: Icon(Icons.pie_chart, color: Theme.of(context).primaryColor,),
      ),

    );
  }
}
