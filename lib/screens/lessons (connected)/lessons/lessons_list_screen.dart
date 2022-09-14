import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:social_support/models/lesson_info.dart';
import 'package:social_support/providers/lessons_info.dart';
import './add_lesson_screen.dart';

import '../../../providers/auth.dart';
import '../../../widgets/adaptive_floating_button.dart';
import 'lesson_details_screen.dart';

class LessonsListScreen extends StatelessWidget {

  static const String screenRoute = "/lessons-list-screen";

  Widget _buildLessonCard(BuildContext context, LessonInfo lessonInfo){
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text(
          lessonInfo.title,
          style: Theme.of(context).textTheme.headline4,
        ),
        trailing: Icon(Icons.more_horiz),
        onTap: () => Navigator.of(context).pushNamed(LessonDetailsScreen.screenRoute, arguments: lessonInfo),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    LessonsInfo lessonsInfo = Provider.of<LessonsInfo>(context);
    Auth auth = Provider.of<Auth>(context);
    return Scaffold(
      floatingActionButton: auth.isTeacher ? AdaptiveFloatingButton(onPressed: () {
        Navigator.of(context).pushNamed(AddLessonScreen.screenRoute);
      }, icon: Icons.add,) : null,
      appBar: AppBar(
        title: Text("תיעוד שיעור 'התחברתי'"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 28.h, width: double.infinity,),
              Text(
                "תיעוד שיעור 'התחברתי'",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline2,
              ),
              SizedBox(height: 10.h,),
              Text(
                "תיעוד ותיאור של שיעורים ופעיליות\nחברתיות שהועלו ע”י מורים"
                , style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40.h,),
              ...lessonsInfo.lessons.map((LessonInfo lessonInfo) => _buildLessonCard(context, lessonInfo)).toList()
            ],
          ),
        ),
      ),
    );
  }
}
