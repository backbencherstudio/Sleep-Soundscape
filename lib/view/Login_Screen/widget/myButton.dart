import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class Mybutton extends StatelessWidget {
  String text;
  Color color;
  void Function()? ontap;
  Mybutton({
    super.key,
    required this.text,
    required this.color,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 56.h,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: color,
        ),
        child: Center(child: Text(text,
      style:Theme.of(context).textTheme.bodyMedium?.copyWith(
        color: Theme.of(context).colorScheme.onPrimary,
      )
        )),
      ),
    );
  }
}
