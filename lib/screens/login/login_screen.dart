import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_support/screens/home_screen.dart';
import '../../providers/auth.dart';
class LoginScreen extends StatelessWidget {
  static const String screenRoute = "/login-screen";

  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  String _username = "";
  String _password = "";


  void _submitLogin(BuildContext context) {
    bool isValid = _form.currentState!.validate();
    if (!isValid)
      return;

    Auth auth = Provider.of<Auth>(context, listen: false);
    _form.currentState!.save();
    bool isLoggedIn = auth.login(_username, _password);
    if (!isLoggedIn){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("שם משתמש או סיסמא שגויים"), duration: Duration(seconds: 3),));
      return;
    }
    Navigator.of(context).pushReplacementNamed(
        HomeScreen.routeName);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15)
            ),
            height: 400.h,
            width: 290.w,
            margin: EdgeInsets.symmetric(vertical: 127.h, horizontal: 35.w),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 35.h, horizontal: 59.w),
              child: Form(
                key: _form,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        "שם משתמש",
                        style: Theme
                            .of(context)
                            .textTheme
                            .headline4,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        validator: (String? value){
                          if (value == null || value.isEmpty)
                            return "אנא הזן מידע";
                        },
                        onSaved: (value) {
                          _username = value!.trim();
                        },
                      ),
                      SizedBox(
                        height: 28.h,
                      ),
                      Text(
                        "סיסמה",
                        style: Theme
                            .of(context)
                            .textTheme
                            .headline4,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      TextFormField(
                        // password type stuff
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),

                        ),
                        validator: (String? value){
                          if (value == null || value.isEmpty)
                            return "אנא הזן מידע";
                        },
                        onSaved: (String? value) {
                          _password = value!.trim();
                        },
                      ),
                      SizedBox(
                        height: 60.h,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _submitLogin(context);
                        },
                        child: Text(
                          "התחבר",
                          style: Theme
                              .of(context)
                              .textTheme
                              .headline4!.copyWith(color: Colors.white),

                        ),
                      ),
                      // TextButton(
                      //   onPressed: () {
                      //     _submitLogin(context);
                      //   },
                      //   child: Text(
                      //     "אפס נתונים",
                      //     style: Theme
                      //         .of(context)
                      //         .textTheme
                      //         .headline4!.copyWith(color: Theme.of(context).primaryColor),
                      //
                      //   ),
                      // )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
