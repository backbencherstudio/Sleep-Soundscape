import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;
  final double paddingVertical;
  final double paddingHorizontal;
  final double fontSize;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = const Color(0xffFAD051), // Default Red Color
    this.textColor = Colors.black,
    this.borderRadius = 16.0,
    this.paddingVertical = 14.0,
    this.paddingHorizontal = 24.0,
    this.fontSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // 80% of screen width
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: EdgeInsets.symmetric(
            vertical: paddingVertical.h,
            horizontal: paddingHorizontal.w,
          ),
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: textColor,
                fontSize: fontSize,
            fontWeight: FontWeight.w600
          )
        ),
      ),
    );
  }
}
