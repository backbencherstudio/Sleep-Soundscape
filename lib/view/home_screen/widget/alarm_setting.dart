import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sleep_soundscape/view/home_screen/widget/sound_scape.dart';
import 'package:sleep_soundscape/view/sounds_screen/widget/sound_dediction.dart';
import 'package:sleep_soundscape/view/sounds_screen/widget/switch_button.dart';

void alarmSetting(BuildContext context) {
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
                        text: "Sleep ",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: "Setting",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Color(0xffFAD051),
                          fontWeight: FontWeight.w500,
                          fontSize: 20.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "Done",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.red,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(height: 35.h),

            // Alarm Section
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Alarm",
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Color.fromRGBO(255, 255, 255, 0.30),
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                ),
              ),
            ),
            SizedBox(height: 12.h),

            // Switch Row using ValueListenableBuilder
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Alarm",
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
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Vibration",
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
            SizedBox(height: 12.h),
            Row(
              children: [
                Icon(Icons.notifications_outlined, color: Colors.white60),
                SizedBox(width: 10.w),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: LinearProgressIndicator(
                    value: 0.5,
                    minHeight: 1,
                    color: Color(0xffFAD051),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h),
            Align(
              alignment: Alignment.topLeft,

              child: Container(
                width:
                    MediaQuery.of(context).size.width *
                    0.5, // 50% of screen width
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14.r),
                  image: DecorationImage(
                    image: AssetImage("assets/images/white_sound.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                padding: EdgeInsets.all(12.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Ringtone",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "Shadow of rain",
                            style: TextStyle(
                              color: Colors.white54,
                              fontWeight: FontWeight.w300,
                              fontSize: 10.sp,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white,
                      size: 16.sp,
                    ),
                  ],
                ),
              ),
            ),

            Divider(

                color: Color.fromRGBO(255, 255, 255, 0.30)

            ),

            // Sleep Analysis Section
            SizedBox(height: 18.h),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Sleep Analysis",
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Color.fromRGBO(255, 255, 255, 0.30),
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Sounds Detection",
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
                    "To keep running in low battery, Sleep will stop detection when the battery is below 20% and finish analysis when the battery is below 10%.",
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: Color.fromRGBO(255, 255, 255, 0.60),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "On",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 5.w),
                    GestureDetector(
                      onTap: () => soundDetection(context),
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Divider(color: Color.fromRGBO(255, 255, 255, 0.30)),

            // Soundscapes Section
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Soundscapes",
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Color.fromRGBO(255, 255, 255, 0.30),
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "Soundscapes",
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: Color.fromRGBO(255, 255, 255, 0.60),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Calm Light",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: ()=>soundScape(context),
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 35.h),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Alarm",
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
                  "Alarm",
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
            // Audio Timer Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "Audio timer",
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: Color.fromRGBO(255, 255, 255, 0.60),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "5 min",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 16,
                      color: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
            // Other sections continue...
          ],
        ),
      );
    },
  );
}
