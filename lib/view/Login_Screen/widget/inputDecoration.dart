import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

InputDecoration inputDecoration({required  BuildContext context,  Widget? suffixIcon, String? labelText, String? hintText, Widget? prefixIcon,}) {
  return InputDecoration(
    fillColor: Colors.white.withOpacity(0.04),
    filled: true,
    labelText: labelText,
    labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
      color: Color(0xFFFFFFFFF).withOpacity(0.6),
    ),
    hintText: hintText,
    hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
      color: Color(0xFFFFFFFFF).withOpacity(0.6),
    ),
    floatingLabelStyle: Theme.of(
      context,
    ).textTheme.bodySmall!.copyWith(color: Color(0xFF4B5155), fontSize: 14.sp),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14.r),
      borderSide: BorderSide(color: Color(0xFF4B5155).withOpacity(0.6)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14.r),
      borderSide: BorderSide(color: Color(0xFFFAD051)),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14.r),
      borderSide: BorderSide(color: Color(0xFF9BA2A7)),
    ),
    prefixIcon:prefixIcon ,
    suffixIcon: suffixIcon,
  );
}
