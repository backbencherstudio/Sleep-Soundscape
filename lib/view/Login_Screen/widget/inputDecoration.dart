import 'package:flutter/material.dart';

InputDecoration inputDecoration({required  BuildContext context,  Widget? suffixIcon, String? labelText, String? hintText, Widget? prefixIcon,}) {
  return InputDecoration(
    fillColor: Theme.of(context).inputDecorationTheme.fillColor,
    //Colors.white.withOpacity(0.04),
    filled: true,
    labelText: labelText,
    labelStyle: Theme.of(context).inputDecorationTheme.labelStyle,
    // textTheme.bodyMedium!.copyWith(
    //   color: Color(0xFFFFFFFFF).withOpacity(0.6),
    // ),
    hintText: hintText,
    hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
    // textTheme.bodyMedium!.copyWith(
    //   color: Color(0xFFFFFFFFF).withOpacity(0.6),
    // ),
    floatingLabelStyle: Theme.of(context).inputDecorationTheme.labelStyle,
    enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
    disabledBorder: Theme.of(context).inputDecorationTheme.disabledBorder,
    // OutlineInputBorder(
    //   borderRadius: BorderRadius.circular(14.r),
    //   borderSide: BorderSide(color: Color(0xFF4B5155).withOpacity(0.6)),
    // ),
    focusedBorder:Theme.of(context).inputDecorationTheme.focusedBorder,
    // OutlineInputBorder(
    //   borderRadius: BorderRadius.circular(14.r),
    //   borderSide: BorderSide(color: Color(0xFFFAD051)),
    // ),
    errorBorder: Theme.of(context).inputDecorationTheme.errorBorder,
    // OutlineInputBorder(
    //   borderRadius: BorderRadius.circular(14.r),
    //   borderSide: BorderSide(color: Color(0xFF9BA2A7)),
    // ),
    prefixIcon:prefixIcon ,
    suffixIcon: suffixIcon,
    prefixIconColor: Theme.of(context).inputDecorationTheme.prefixIconColor,
    suffixIconColor: Theme.of(context).inputDecorationTheme.suffixIconColor,
  );
}
