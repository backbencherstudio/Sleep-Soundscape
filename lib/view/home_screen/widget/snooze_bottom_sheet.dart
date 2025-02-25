import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sleep_soundscape/global_widget/custom_button.dart';

import '../../reminder_screen/reminder_widgets/reminder_widgets.dart';

void snoozeBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    // backgroundColor: Colors.transparent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
    ),
    builder: (BuildContext context) {
      return Container(
        height: MediaQuery.of(context).size.height*0.5,
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
                      text: "Snooze",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        // color: Colors.white,
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
            Align(
              alignment: Alignment.center,

              child:       Row(
                spacing: 5.w,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ReminderWidgets().buildCupertinoPicker(
                    context,
                    [01, 02, 03, 04, 05, 06, 07, 08, 09, 10, 11, 12],
                    8,
                        (value) {
                      debugPrint("\nValue : $value\n");
                    },
                    false,
                  ),
                  Text(":"),
                  ReminderWidgets().buildCupertinoPicker(
                    context,
                    [
                      1,
                      2,
                      3,
                      4,
                      5,
                      6,
                      7,
                      8,
                      9,
                      10,
                      11,
                      12,
                      13,
                      14,
                      15,
                      16,
                      17,
                      18,
                      19,
                      20,
                      21,
                      22,
                      23,
                      24,
                      25,
                      26,
                      27,
                      28,
                      29,
                      30,
                    ],
                    22,
                        (value) {
                      debugPrint("\nValue : $value\n");
                    },
                    false,
                  ),

                  ReminderWidgets().buildCupertinoPicker(
                    context,
                    ['AM', 'PM'],
                    'PM',
                        (value) {
                      debugPrint("\nValue : $value\n");
                    },
                    true,
                  ),
                ],
              ),
            ),
            SizedBox(height: 40.h),

            Align(
                alignment: Alignment.center,
                child: CustomButton(text: "Save", onPressed: (){})),
            SizedBox(height: 6.h),

          ],
        ),
      );
    },
  );
}
