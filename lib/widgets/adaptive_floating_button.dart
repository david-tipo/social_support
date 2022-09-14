import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class AdaptiveFloatingButton extends StatelessWidget {

  final VoidCallback onPressed;
  final IconData icon;

  AdaptiveFloatingButton({required this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenUtil().radius(70),
      width: ScreenUtil().radius(70),
      child: FloatingActionButton(
        child: Icon(Icons.add, size: ScreenUtil().radius(50),),
        onPressed: onPressed,
      ),
    );
  }
}
