import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utils/config.dart';

class CustomeContainer extends StatelessWidget {


  final double bottomMargin;
  final Color color ;
  final Widget widget;

  const CustomeContainer({Key? key,required this.color, required this.widget, required this.bottomMargin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      //margin: EdgeInsets.only(left: horizontalPadding.w,right: horizontalPadding.w,bottom: bottomMargin.h),
      margin: EdgeInsets.only(bottom: bottomMargin.h),
      padding: EdgeInsets.only(left: 20,right: horizontalPadding.w, top: 5, bottom: 5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radiusMedium.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 3.0,
            offset: Offset(0, 0),
            spreadRadius: 3.0,
          ),
        ],
      ),
      child: widget,
    );
  }
}
