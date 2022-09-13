import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:bordered_text/bordered_text.dart';

import 'package:social_support/screens/main%20problems%20and%20tips/main_problems_screen.dart';

class EfratScreen extends StatelessWidget {
  static const String screenRoute = "/efrat-screen";

  Widget _textBuilder(String text, Color borderColor) {
    return BorderedText(
      strokeColor: borderColor,
      strokeWidth: 4,
      child: Text(text, style: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        letterSpacing: 2,
      ),),
    );
  }

  Widget _textBoxBuilder() {
    return TextField(
      maxLines: 5,
    );
  }

  Widget _subtitleBuilder(String text) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: "SecularOne",
        fontSize: 16.sp,
      ),
    );
  }

  void _skipPress(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(MainProblemsScreen.screenRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        height: ScreenUtil().radius(60),
        width: ScreenUtil().radius(60),
        child: FloatingActionButton(
          child: Text("דלג",
          style: TextStyle(
            fontSize: 16.sp,
          ),),
          onPressed: () {
            _skipPress(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 45.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40.h,
              ),
              Text(
                "עמוד אפר\"ת מאפשר לבחון את\nהחוויה מחדש ולהרגיש טוב יותר"
                , style: Theme.of(context).textTheme.headline3,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 40.h,
              ),
              _textBuilder("אירוע", Colors.blue),
              SizedBox(
                height: 11.h,
              ),
              _subtitleBuilder("מה קרה??"),
              SizedBox(
                height: 9.h,
              ),
              _textBoxBuilder(),
              SizedBox(
                height: 43.h,
              ),
              _textBuilder("פרשנות", Colors.green),
              SizedBox(
                height: 11.h,
              ),
              _subtitleBuilder(
                  "מה אני חושבת על מה שקרה?\nמה אני חושבת על האנשים שקשורים למה שקרה? "),
              SizedBox(
                height: 9.h,
              ),
              _textBoxBuilder(),
              SizedBox(
                height: 43.h,
              ),
              _textBuilder("רגש", Colors.amber),
              SizedBox(
                height: 11.h,
              ),
              _subtitleBuilder("אלו רגשות עולים בי?"),
              SizedBox(
                height: 9.h,
              ),
              _textBoxBuilder(),
              SizedBox(
                height: 43.h,
              ),
              _textBuilder("תגובה", Colors.red),
              SizedBox(
                height: 11.h,
              ),
              _subtitleBuilder("כיצד הגבתי למה שקרה?\nכיצד אגיב עכשיו? "),
              SizedBox(
                height: 9.h,
              ),
              _textBoxBuilder(),
              SizedBox(
                height: 43.h,
              ),
              TextButton(
                  onPressed: () {
                    _skipPress(context);
                  },
                  child: Text("בכל זאת אני צריכה טיפ", style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.blue)), )
            ],
          ),
        ),
      ),
    );
  }
}
