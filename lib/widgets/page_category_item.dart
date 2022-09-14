import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class PageCategoryItem extends StatelessWidget {

  final String screenRoute;
  final String text;
  final Color color;

  PageCategoryItem(
  {required this.text, required this.color, required this.screenRoute}
      );


  void tap (BuildContext context) {
    Navigator.of(context).pushNamed(screenRoute);
  }


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => tap(context),
      splashColor: Theme.of(context).primaryColor,
      radius: 15,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(ScreenUtil().radius(15)),
        ),
        child: Text(text, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
      ),
    );
  }
}
