import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:social_support/screens/login/login_screen.dart';


class LogoScreen extends StatelessWidget {
  const LogoScreen({Key? key}) : super(key: key);

  static const String screenRoute = "/logo-screen";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        Image.asset("assets/root_logo.jpg"),
        SizedBox(
          height: 40.h,
          width: double.infinity,
        ),
        SizedBox(
          width: 150.w,
          height: 70.h,
          child: ElevatedButton(
              onPressed: () {
            Navigator.of(context).pushReplacementNamed(LoginScreen.screenRoute);
          }, child: Text("המשך", style: TextStyle(fontSize: 22.sp, fontFamily: "SecularOne"),),
          ),
        ),
      ]),
    );
  }
}
