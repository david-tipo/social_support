import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:social_support/widgets/page_category_item.dart';

import '../dummy_data.dart';
import '../models/page_category.dart';
import '../providers/auth.dart';
import '../widgets/main_drawer.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "/home-screen";

  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of<Auth>(context);
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        title: Text(
          "דף הבית",
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 35.w),
        child: Column(
          children: [

            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(letterSpacing: 0.2),
                children: <TextSpan>[
                  TextSpan(
                    text: "ברוכה הבאה "
                  ),
                  TextSpan(text: auth.username.toString(), style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(letterSpacing: 0.2,
                  color: Theme.of(context).primaryColor),),
                  TextSpan(
                      text:  "\nאיזה כיף ש'הת"
                  ),
                  TextSpan(
                    text: "חבר",
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(letterSpacing: 0.2,
                        color: Theme.of(context).primaryColor),
                  ),
                  TextSpan(
                    text: "ת' איתנו!\nהקליקי במקום המתאים"
                  )
                ],


              ),


            ),
            SizedBox(
              height: 30.h,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(),
                child: GridView(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: (80 + 55.w),
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 20.w,
                    mainAxisSpacing: 24.h,
                  ),
                  children: [
                    ...DUMMY_DATA.pageCategories(auth.isTeacher)
                        .map(
                          (PageCategory item) => PageCategoryItem(
                              text: item.title,
                              color: item.color,
                              screenRoute: item.screenRoute),
                        )
                        .toList()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
