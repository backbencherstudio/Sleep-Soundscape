import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class Custombox extends StatelessWidget {
  String text;
  Custombox({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFFF).withOpacity(0.1),
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: Color(0xFFFFFFFF).withOpacity(0.2), width: 1),
      ),

      child: Padding(
        padding: EdgeInsets.all(12),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.w300,
            color: Color(0xFFFFFFFF),
          ),
        ),
      ),
    );
  }
}
