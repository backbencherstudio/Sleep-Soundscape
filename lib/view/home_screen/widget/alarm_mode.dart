import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void alarmMode(BuildContext context) {
  showModalBottomSheet(
    context: context,
    // backgroundColor: Colors.transparent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
    ),
    builder: (BuildContext context) {
      return Container(
        height: 300,
        decoration: BoxDecoration(
          // color: Color(0xff0F0F13),
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        ),
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Alarm ",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        // color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: "mode",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Color(0xffFAD051),
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 12.h),

            // Preferred Earphones
            Text(
              "Preferred earphones",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                // color: Color.fromRGBO(255, 255, 255, 0.60),
                fontSize: 16.sp,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(height: 18.h),

            Divider(color: Color.fromRGBO(255, 255, 255, 0.60), height: 1),
            SizedBox(height: 18.h),
            // Always Use Speaker Option
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Always use speakers",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    // color: Color.fromRGBO(255, 255, 255, 0.60),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Icon(Icons.check, color: Color(0xffFAD051)),
              ],
            ),
          ],
        ),
      );
    },
  );
}
