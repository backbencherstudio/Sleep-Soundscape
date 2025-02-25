import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sleep_soundscape/global_widget/custom_button.dart';

void offTheDetectionBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    // backgroundColor: Colors.transparent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
    ),
    builder: (BuildContext context) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.5,
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
                      text: "Off the  ",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        // color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: "detection",
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
              "Off",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                // color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(height: 18.h),

            Divider(color: Color.fromRGBO(255, 255, 255, 0.20), height: 1),
            SizedBox(height: 18.h),
            // Always Use Speaker Option
            ListTile(
              title: Text("Off only this time"),
              titleTextStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                // color: Colors.white,
                fontWeight: FontWeight.w300,
                fontSize: 16.sp,
              ),
              subtitle: Text("Keep off till finished next sleep session"),
              subtitleTextStyle: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(
                // color: Color.fromRGBO(255, 255, 255, 0.60),
                fontSize: 12.sp,
                fontWeight: FontWeight.w300,
              ),
              trailing: Icon(Icons.check, color: Color(0xffFAD051)),
            ),
            SizedBox(height: 32.h),

            Align(
              alignment: Alignment.center,
              child: CustomButton(text: "Set Timer", onPressed: () {}),
            ),
          ],
        ),
      );
    },
  );
}
