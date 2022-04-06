import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utils/config.dart';

class BaseFormField extends StatelessWidget {

  final int maxLines;
  final TextEditingController? controller;
  final String? Function(String?)? validation;
  final String? Function(String?)? onChange;
  final double bottomMargin;
  final bool isValid;
  final bool obscureText;
  final Color color ;
  final String initialValue;
  const BaseFormField({Key? key,required this.color,  this.maxLines = 1, this.controller, this.validation, this.bottomMargin = dropDownBottomMargin, this.isValid = true,this.obscureText=false, this.onChange, required this.initialValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      //margin: EdgeInsets.only(left: horizontalPadding.w,right: horizontalPadding.w,bottom: bottomMargin.h),
      margin: EdgeInsets.only(bottom: bottomMargin.h),
      padding: EdgeInsets.only(left: horizontalPadding.w,right: horizontalPadding.w, top: 10, bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(width: 1,color: isValid ? Colors.transparent : Colors.red),
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
      child: TextFormField(
        obscureText: obscureText,
        maxLines: maxLines,
        validator: validation,
        controller: controller,
        onChanged: onChange,
        initialValue: initialValue,
        decoration: InputDecoration(
          // errorStyle: TextStyle(height: 0,fontSize: 25),
          isDense: true,
          floatingLabelBehavior: maxLines > 1 ? FloatingLabelBehavior.always:FloatingLabelBehavior.auto,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
