import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home_screen.dart';

class RateWeekScreen extends StatefulWidget {
  static const String screenRoute = "/rate-week-screen";

  @override
  State<RateWeekScreen> createState() => _RateWeekScreenState();
}

int? selectedNum;

class _RateWeekScreenState extends State<RateWeekScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "דירוג שבועי",
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 35.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "כיצד הייתי מסכמת את השבוע\nהאחרון מבחינה חברתית? ",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(letterSpacing: 0.6),
              ),
              SizedBox(
                height: 30.h,
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                child: Container(
                  height: 148.h,
                  width: 290.w,
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _circleBuilder(context, 1),
                          _circleBuilder(context, 2),
                          _circleBuilder(context, 3),
                          _circleBuilder(context, 4),
                          _circleBuilder(context, 5),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _circleBuilder(context, 6),
                          _circleBuilder(context, 7),
                          _circleBuilder(context, 8),
                          _circleBuilder(context, 9),
                          _circleBuilder(context, 10),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 48.h,
              ),
              Text(
                "מדוע בחרתי במספר זה? (רשות)",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(letterSpacing: 0.6),
              ),
              SizedBox(
                height: 10.h,
              ),
              const TextField(
                maxLines: 5,
                decoration:
                    InputDecoration(filled: true, fillColor: Colors.white),
              ),
              SizedBox(
                height: 70.h,
              ),
              ElevatedButton(
                  onPressed: () => _showAlert(context),
                  child: Text(
                    "שליחה",
                    style: Theme.of(context).textTheme.headline4,
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget _circleBuilder(BuildContext context, int number) {
    bool selected = _isSelected(number);
    return InkWell(
      radius: 20,
      onTap: () {
        _pressed(number);
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: CircleAvatar(
          child: Text(
            number.toString(),
            style: TextStyle(fontSize: 20.sp, color: Colors.black),
          ),
          backgroundColor: selected ? Colors.amber : Colors.white,
        ),
      ),
    );
  }

  void _pressed(int number) {
    setState(() {
      selectedNum = number;
    });
  }

  bool _isSelected(int number) {
    return number == selectedNum;
  }

  void _showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        alignment: Alignment.center,
        content: Container(
            height: 290.h,
            child: Column(
              children: [
                Text("הנתונים נשמרו בהצלחה!", style: Theme.of(context).textTheme.headline2,),
                SizedBox(height: 50.h,),
                ElevatedButton(
                    onPressed: () {
                      Navigator.popUntil(context, ModalRoute.withName(HomeScreen.routeName));
                    },
                    child: Text(
                      "חזור לדף הבית",
                    )),
              ],
            )),
      ),
    );
  }
}
