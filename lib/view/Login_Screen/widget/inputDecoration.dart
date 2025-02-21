import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

InputDecoration inputDecoration(
  BuildContext context,
  Widget? suffixIcon,
  String lebel,
  Widget? puffix,
) {
  return InputDecoration(
    fillColor: Colors.grey.shade700.withOpacity(0.2),
    filled: true,
    labelText: lebel,
    labelStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
      color: Color(0xFFFFFFFFF),
      fontWeight: FontWeight.w500,
      fontSize: 14.sp,
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
    prefixIcon: suffixIcon,
    suffixIcon: puffix,
  );
}
