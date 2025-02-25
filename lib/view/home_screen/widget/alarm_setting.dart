import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sleep_soundscape/view/home_screen/widget/snooze_bottom_sheet.dart';
import 'package:sleep_soundscape/view/home_screen/widget/sound_scape.dart';
import 'package:sleep_soundscape/view/sounds_screen/widget/sound_dediction.dart';
import 'package:sleep_soundscape/global_widget/switch_button.dart';

import 'alarm_mode.dart';
import 'get_up_challange.dart';

void alarmSetting(BuildContext context) {
  ValueNotifier<bool> isAlarmSwitched = ValueNotifier<bool>(false);
  ValueNotifier<bool> isVibrationSwitched = ValueNotifier<bool>(false);
  ValueNotifier<bool> isAutoPlay = ValueNotifier<bool>(false);

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    // shape: RoundedRectangleBorder(
    //   borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    // ),

    builder: (BuildContext context) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: MediaQuery.of(context).size.height * 0.96,
        // decoration: BoxDecoration(color: Color(0xff0F0F13)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 24.h),
              _buildHeader(context),
              SizedBox(height: 35.h),

              // Alarm Section
              _buildSectionTitle(context,"Alarm",),
              _buildSwitchRow(context,"Alarm", isAlarmSwitched),
              _buildSwitchRow(context,"Vibration", isVibrationSwitched),

              SizedBox(height: 12.h),
              _buildProgressBar(context),

              SizedBox(height: 18.h),
              _buildSoundPreview(context),
              SizedBox(height: 18.h),

              Divider(color: Color.fromRGBO(255, 255, 255, 0.30)),
              SizedBox(height: 18.h),

              // Sleep Analysis
              _buildSectionTitle(context,"Sleep Analysis"),
              _buildSectionTitle(context,"Sounds Detection"),
              SizedBox(height: 4.h),

              _buildInfoRow(context,
                "To keep running in low battery, Sleep will stop detection when the battery is below 20% and finish analysis when the battery is below 10%.",
                "On",
                () => soundDetection(context),
              ),

              Divider(color: Color.fromRGBO(255, 255, 255, 0.30)),

              // Soundscapes
              _buildSectionTitle(context,"Soundscapes"),
              _buildInfoRow(context,
                "Soundscapes",
                "Calm Light",
                () => soundScape(context),
              ),

              SizedBox(height: 35.h),

              // Alarm & Advanced Settings
              _buildSectionTitle(context,"Alarm"),
              _buildSwitchRow(context,"Autoplay sounds while sleeping", isAutoPlay),

              _buildInfoRow(context,"Audio timer", "5 min", null),
              Divider(color: Color.fromRGBO(255, 255, 255, 0.60)),

              SizedBox(height: 10.h),
              _buildSectionTitle(context,"Advanced"),
              SizedBox(height: 21.h),

              _buildInfoRow(context,
                "Snooze",
                "5 min",
                () => snoozeBottomSheet(context),
              ),
              SizedBox(height: 24.h),

              _buildInfoRow(context,
                "Alarm mode",
                "Always use",
                () => alarmMode(context),
              ),
              SizedBox(height: 24.h),

              _buildInfoRow(context,
                "Get-up Challenge",
                "None",
                () => getChallange(context),
              ),
              SizedBox(height: 18.h),
            ],
          ),
        ),
      );
    },
  );
}

/// 🔹 **Header with Back Button & Title**
Widget _buildHeader(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(
              // color: Colors.grey,
              width: 1,
            ),
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: EdgeInsets.all(7.r),
            child: Icon(
              Icons.arrow_back_ios,
              // color: Colors.white,
              size: 10.sp,
            ),
          ),
        ),
      ),
      RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "Sleep ",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
              // style: TextStyle(
              //   // color: Colors.white,
              //   fontSize: 20.sp,
              //   fontWeight: FontWeight.w500,
              // ),
            ),
            TextSpan(
              text: "Setting",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Color(0xffFAD051),
                fontWeight: FontWeight.w500,
                fontSize: 20.sp,
              ),
            ),
          ],
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Text(
          "Done",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Colors.red,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),

        ),
      ),
    ],
  );
}

/// 🔹 **Reusable Section Title**
Widget _buildSectionTitle(BuildContext context,String title) {
  return Align(
    alignment: Alignment.topLeft,
    child: Text(
      title,
      textAlign: TextAlign.left,
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
        // color:
        // title == "Sounds Detection"
        //     ? Colors.white
        //     : Color.fromRGBO(255, 255, 255, 0.30),
        fontWeight: FontWeight.w400,
        fontSize: 12.sp,
      ),

    ),
  );
}

/// 🔹 **Switch Button Row**
Widget _buildSwitchRow(BuildContext context,String label, ValueNotifier<bool> switchNotifier) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        label,
        textAlign: TextAlign.left,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          // label == "Autoplay sounds while sleeping"
          //     ? Color.fromRGBO(255, 255, 255, 0.50)
          //     : Colors.white,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),

      ),
      ValueListenableBuilder<bool>(
        valueListenable: switchNotifier,
        builder: (context, value, child) {
          return SwitchButton(
            isSwitchOn: value,
            onChange: (bool newValue) {
              switchNotifier.value = newValue;
            },
          );
        },
      ),
    ],
  );
}

/// 🔹 **Progress Bar**
Widget _buildProgressBar(BuildContext context) {
  return Row(
    children: [
      Icon(Icons.notifications_outlined, color: Colors.white60),
      SizedBox(width: 10.w),
      Expanded(
        child: LinearProgressIndicator(
          value: 0.5,
          minHeight: 1,
          color: Color(0xffFAD051),
        ),
      ),
    ],
  );
}

/// 🔹 **Sound Preview Widget**
Widget _buildSoundPreview(BuildContext context) {
  return Align(
    alignment: Alignment.topLeft,
    child: Container(
      width:
          MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width *
          0.5,
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
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    // color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp,
                  ),

                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "Shadow of rain",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    // color: Colors.white54,
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
          Transform.translate(
            offset: Offset(2, 0),
            child: Icon(Icons.arrow_back_ios, size: 10.sp),
          ),
        ],
      ),
    ),
  );
}

/// 🔹 **Reusable Info Row (Label + Action)**
Widget _buildInfoRow(BuildContext context,String text, String actionText, VoidCallback? onTap) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: Text(
          text,
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 12.sp,
            // color:
            // text ==
            //     "To keep running in low battery, Sleep will stop detection when the battery is below 20% and finish analysis when the battery is below 10%."
            //     ? Color.fromRGBO(255, 255, 255, 0.50)
            //     : Colors.white,
          ),

        ),
      ),
      Row(
        children: [
          Text(
            actionText,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.w300,
              // color: Color.fromRGBO(255, 255, 255, 0.60),
            ),

          ),
          if (onTap != null) ...[
            SizedBox(width: 5.w),
            GestureDetector(
              onTap: onTap,
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16,
                // color: Colors.white,
              ),
            ),
          ],
        ],
      ),
    ],
  );
}
