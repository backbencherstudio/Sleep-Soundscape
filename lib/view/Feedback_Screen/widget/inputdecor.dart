import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

InputDecoration inputDecoration2(
  BuildContext context,
  Widget? suffixIcon,
  String lebel,
  Widget? puffix,
) {
  return InputDecoration(
    floatingLabelBehavior: FloatingLabelBehavior.always,

    fillColor: Colors.grey.shade700.withOpacity(0.2),
    filled: true,

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
    hintText: lebel,
    hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
      fontSize: 12.sp,
      fontWeight: FontWeight.w300,
      color: Color(0xFFFFFFFFF).withOpacity(0.6),
    ),
    prefixIcon: suffixIcon,
    suffixIcon: puffix,
  );
}
