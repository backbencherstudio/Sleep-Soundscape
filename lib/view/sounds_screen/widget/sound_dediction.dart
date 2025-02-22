import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sleep_soundscape/view/sounds_screen/widget/switch_button.dart';

void soundDetection(BuildContext context) {
  ValueNotifier<bool> isSwitched = ValueNotifier<bool>(false);

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
    ),
    builder: (BuildContext context) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: MediaQuery.of(context).size.height * 0.96,
        decoration: BoxDecoration(color: Color(0xff0F0F13)),
        child: Column(
          children: [
            SizedBox(height: 24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.grey, width: 1),
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(7.r),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 10.sp,
                    ),
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Sound ",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: "detection",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Color(0xffFAD051),
                          fontWeight: FontWeight.w500,
                          fontSize: 20.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 35.h),

            // Alarm Section
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Sound detection",
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Color.fromRGBO(255, 255, 255, 0.30),
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                ),
              ),
            ),
            SizedBox(height: 18.h),

            // Switch Row using ValueListenableBuilder
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Sound detection",
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                ValueListenableBuilder<bool>(
                  valueListenable: isSwitched,
                  builder: (context, value, child) {
                    return SwitchButton(
                      isSwitchOn: value,
                      onChange: (bool newValue) {
                        isSwitched.value = newValue;
                      },
                    );
                  },
                ),
              ],
            ),

            // Sleep Analysis Section
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Audio clean audio recordings",
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                ),
              ),
            ),
            SizedBox(height: 4.h),

            // Battery Warning Text
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "To keep running in low battery, Sleep will stop detection when the betrary below 20% and finish analyse when the betrary below 10% ",
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: Color.fromRGBO(255, 255, 255, 0.60),
                    ),
                  ),
                ),
                ValueListenableBuilder<bool>(
                  valueListenable: isSwitched,
                  builder: (context, value, child) {
                    return SwitchButton(
                      isSwitchOn: value,
                      onChange: (bool newValue) {
                        isSwitched.value = newValue;
                      },
                    );
                  },
                ),
              ],
            ),

            Divider(color: Color.fromRGBO(255, 255, 255, 0.30),),

            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Advanced",
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Color.fromRGBO(255, 255, 255, 0.30),
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                ),
              ),
            ),
            SizedBox(height: 18.h,),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Clean all audio recordings",
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                ),
              ),
            ),
            SizedBox(height: 4.h,),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Total audio 0.00 Mb",
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Color.fromRGBO(255, 255, 255, 0.30),
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                ),
              ),
            ),

            // Other sections continue...
          ],
        ),
      );
    },
  );
}
