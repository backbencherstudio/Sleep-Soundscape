import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sleep_soundscape/model_view/reminder_screen_provider.dart';
import 'package:sleep_soundscape/view/reminder_screen/reminder_widgets/reminder_widgets.dart';

class AddReminderScreen extends StatelessWidget {
  dynamic nothing(dynamic id) {
    debugPrint("\nNumber : $id\n");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 58.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.all(6.r),
              width: 115.w,
              height: 6.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.white.withOpacity(0.1),
              ),
            ),
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap:
                    () => context.read<ReminderScreenProvider>().setPageID(1),
                child: Container(
                  width: 32.w,
                  height: 32.h,
                  padding: EdgeInsets.all(7.r),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white.withOpacity(0.08)),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                    size: 18.r,
                  ),
                ),
              ),
              Text(
                "Add Reminder",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(padding: EdgeInsets.all(0)),
                onPressed: () {},
                child: Text(
                  "Save",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontSize: 12.sp),
                ),
              ),
            ],
          ),
          SizedBox(height: 25.h),
          Text("Reminder Time"),
          SizedBox(height: 24.h),
          Row(
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
        ],
      ),
    );
  }
}
