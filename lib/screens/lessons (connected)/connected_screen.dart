import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'dart:math' as math;

import 'package:social_support/screens/lessons%20(connected)/lessons/lessons_list_screen.dart';
import 'package:social_support/screens/lessons%20(connected)/takes%20for%20life/takes_list_screen.dart';

import 'improvement/improve_list_screen.dart';

class StarClipper extends CustomClipper<Path> {
  StarClipper(this.numberOfPoints);

  /// The number of points of the star
  final int numberOfPoints;

  @override
  Path getClip(Size size) {
    double width = size.width;
    print(width);
    double halfWidth = width / 2;

    double bigRadius = halfWidth;

    double radius = halfWidth / 1.3;

    num degreesPerStep = _degToRad(360 / numberOfPoints);

    double halfDegreesPerStep = degreesPerStep / 2;

    var path = Path();

    double max = 2 * math.pi;

    path.moveTo(width, halfWidth);

    for (double step = 0; step < max; step += degreesPerStep) {
      path.lineTo(halfWidth + bigRadius * math.cos(step),
          halfWidth + bigRadius * math.sin(step));
      path.lineTo(halfWidth + radius * math.cos(step + halfDegreesPerStep),
          halfWidth + radius * math.sin(step + halfDegreesPerStep));
    }

    path.close();
    return path;
  }

  num _degToRad(num deg) => deg * (math.pi / 180.0);

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    StarClipper oldie = oldClipper as StarClipper;
    return numberOfPoints != oldie.numberOfPoints;
  }
}



class ConnectedScreen extends StatelessWidget {

  static const String screenRoute = "/connected-screen";

  Widget _startBuilder(BuildContext context, String text, Color color, String screenRoute, {Color textColor = Colors.black}){
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(screenRoute);
      },
      child: SizedBox(
        height: ScreenUtil().radius(170),
        width: ScreenUtil().radius(170),
        child: ClipPath(
          clipper: StarClipper(15),
          child: Container(
            color: color,
            height: 120,
            alignment: Alignment.center,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textColor,
                  fontSize: 20.sp,
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("'התחברתי'"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 28.h,
              width: double.infinity,
            ),
            Text("מהנעשה בשיעורי 'התחברתי'", style: Theme.of(context).textTheme.headline2, textAlign: TextAlign.center,),
            SizedBox(
                height: 35.h
            ),
            _startBuilder(context, "תיעוד\nמהשיעור", Colors.green, LessonsListScreen.screenRoute),
            SizedBox(
                height: 35.h
            ),
            _startBuilder(context, "השתפרנו\nב..", Colors.amber, ImproveListScreen.screenRoute),
            SizedBox(
                height: 35.h
            ),
            _startBuilder(context, "לקחתי\nאיתי", Colors.blue, TakesListScreen.screenRoute,),
          ],
        ),
      )
    );
  }
}
