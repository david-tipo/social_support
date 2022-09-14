import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:social_support/providers/custom_problems.dart';
import 'package:social_support/providers/improved_in_provider.dart';
import 'package:social_support/providers/lessons_info.dart';
import 'package:social_support/providers/personal_problems.dart';
import 'package:social_support/providers/takes_for_life_provider.dart';
import 'package:social_support/screens/class_report_screen.dart';
import 'package:social_support/screens/efrat_screen.dart';
import 'package:social_support/screens/home_screen.dart';
import 'package:social_support/screens/lessons%20(connected)/connected_screen.dart';
import 'package:social_support/screens/lessons%20(connected)/improvement/add_improvement_screen.dart';
import 'package:social_support/screens/lessons%20(connected)/improvement/improve_list_screen.dart';
import 'package:social_support/screens/lessons%20(connected)/improvement/improvement_details_screen.dart';
import 'package:social_support/screens/lessons%20(connected)/lessons/add_lesson_screen.dart';
import 'package:social_support/screens/lessons%20(connected)/lessons/lesson_details_screen.dart';
import 'package:social_support/screens/lessons%20(connected)/lessons/lessons_list_screen.dart';
import 'package:social_support/screens/lessons%20(connected)/takes%20for%20life/add_take_screen.dart';
import 'package:social_support/screens/lessons%20(connected)/takes%20for%20life/take_details_screen.dart';
import 'package:social_support/screens/lessons%20(connected)/takes%20for%20life/takes_list_screen.dart';
import 'package:social_support/screens/login/login_screen.dart';
import 'package:social_support/screens/personal%20problems%20and%20solutions/personal_problem_details_screen.dart';
import 'package:social_support/screens/rate_week_screen.dart';
import 'package:social_support/screens/students%20reports/student_report_screen.dart';
import 'package:social_support/screens/students%20reports/students_list_screen.dart';
import 'package:social_support/screens/users%20problems%20and%20tips/add_custom_problem_screen.dart';
import 'package:social_support/screens/users%20problems%20and%20tips/custom_problems_screen.dart';
import 'package:social_support/screens/users%20problems%20and%20tips/custom_tips_screen.dart';

import 'screens/main problems and tips/main_problems_screen.dart';
import 'screens/main problems and tips/main_tips_screen.dart';
import 'screens/personal problems and solutions/personal_problems_screen.dart';
import 'providers/main_problems.dart';
import 'providers/auth.dart';

void main () => runApp(App());


class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  static const accentColor = Color(0xff343232);


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MainProblems>(create: (_) => MainProblems()),
        ChangeNotifierProvider<Auth>(create: (_) => Auth()),
        ChangeNotifierProvider<PersonalProblems>(create: (_) => PersonalProblems()),
        ChangeNotifierProvider<CustomProblems>(create: (_) => CustomProblems()),
        ChangeNotifierProvider<TakesForLifeProvider>(create: (_) => TakesForLifeProvider()),
        ChangeNotifierProvider<ImprovedInProvider>(create: (_) => ImprovedInProvider()),
        ChangeNotifierProvider<LessonsInfo>(create: (_) => LessonsInfo()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 640),
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp(
            builder: (context, child) {
              return Directionality(
                // makes the whole app rtl
                textDirection: TextDirection.rtl,
                child: child!,
              );
            },
            theme: ThemeData(
              primarySwatch: Colors.pink,
              accentColor: Colors.amber,
              canvasColor: const Color.fromRGBO(255, 254, 229, 1),
              textTheme: ThemeData.light().textTheme.copyWith(
                headline2: TextStyle(
                  fontSize: 24.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: "SecularOne",
                  letterSpacing: 1,
                ),
                headline3: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                  headline4: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.black,
                    fontFamily: "SecularOne",
                  ),
                subtitle1: TextStyle(
                  fontSize: 16.sp,
                ),

              ),
              buttonTheme: ButtonTheme.of(context).copyWith(
                buttonColor: Colors.amber,
                textTheme: ButtonTextTheme.primary,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
              ),
              inputDecorationTheme: InputDecorationTheme(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
            ),
              ),
            ),
            routes: {
              '/' : (_) => LoginScreen(),
              // '/' : (_) => HomeScreen(),
              HomeScreen.routeName: (_) => HomeScreen(),
              MainProblemsScreen.screenRoute : (_) => MainProblemsScreen(),
              MainTipsScreen.screenRoute: (_) => MainTipsScreen(),
              LoginScreen.screenRoute: (_) => LoginScreen(),
              PersonalProblemsScreen.screenRoute: (_) => PersonalProblemsScreen(),
              PersonalProblemDetailsScreen.screenRoute: (_) => PersonalProblemDetailsScreen(),
              RateWeekScreen.screenRoute: (_) => RateWeekScreen(),
              StudentsScreen.screenRoute: (_) => StudentsScreen(),
              StudentReportScreen.screenRoute: (_) => StudentReportScreen(),
              ClassReportScreen.screenRoute: (_) => ClassReportScreen(),
              CustomProblemsScreen.screenRoute: (_) => CustomProblemsScreen(),
              AddCustomProblemScreen.screenRoute: (_) => AddCustomProblemScreen(),
              CustomTipScreen.screenRoute: (_) => CustomTipScreen(),
              EfratScreen.screenRoute: (_) => EfratScreen(),
              ConnectedScreen.screenRoute: (_) => ConnectedScreen(),
              LessonsListScreen.screenRoute: (_) => LessonsListScreen(),
              ImproveListScreen.screenRoute: (_) => const ImproveListScreen(),
              TakesListScreen.screenRoute: (_) => const TakesListScreen(),
              AddImprovementScreen.screenRoute: (_) => AddImprovementScreen(),
              AddLessonScreen.screenRoute: (_) => AddLessonScreen(),
              AddTakeScreen.screenRoute: (_) => AddTakeScreen(),
              TakeDetailsScreen.screenRoute: (_) => const TakeDetailsScreen(),
              LessonDetailsScreen.screenRoute: (_) => const LessonDetailsScreen(),
              ImprovementDetailsScreen.screenRoute: (_) => const ImprovementDetailsScreen(),
            },
          );
        },
      ),
    );
  }
}
