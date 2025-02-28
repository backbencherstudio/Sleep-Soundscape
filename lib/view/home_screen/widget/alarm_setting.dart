import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sleep_soundscape/view/home_screen/widget/audio_timer_bottom_sheet.dart';
import 'package:sleep_soundscape/view/home_screen/widget/snooze_bottom_sheet.dart';
import 'package:sleep_soundscape/view/home_screen/widget/sound_scape.dart';
import 'package:sleep_soundscape/view/sounds_screen/widget/sound_dediction.dart';
import 'package:sleep_soundscape/global_widget/switch_button.dart';

import '../../../model_view/sound_setting_provider.dart';
import '../../../model_view/theme_provider.dart';
import 'alarm_mode.dart';
import 'get_up_challange.dart';

void alarmSetting(BuildContext context) {
  final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (BuildContext context) {
      return ChangeNotifierProvider.value(
        value: Provider.of<SoundSettingProvider>(context),
        child: Consumer<SoundSettingProvider>(
          builder: (context, soundSettingProvider, child) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: MediaQuery.of(context).size.height * 0.96,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 24.h),
                    _buildHeader(context, themeProvider, soundSettingProvider),
                    SizedBox(height: 35.h),
                    _buildSectionTitle(context, "Alarm"),
                    _buildSwitchRow(context, "Alarm", soundSettingProvider.soundSettings.alarm?.enabled ?? false, soundSettingProvider.toggleAlarm),
                    _buildSwitchRow(context, "Vibration", soundSettingProvider.soundSettings.alarm?.vibration ?? false, soundSettingProvider.toggleVibration),
                    SizedBox(height: 12.h),
                    _buildProgressBar(context,themeProvider),
                    //_buildVolumeController(),
                    SizedBox(height: 18.h),

                    _buildSoundPreview(soundSettingProvider.soundSettings.alarm?.ringtone?.name ?? "Default"),
                    SizedBox(height: 18.h),

                    Divider(  color: Theme.of(context).colorScheme.onSecondary,),
                    SizedBox(height: 18.h),
                    _buildSectionTitle(context, "Sleep Analysis"),
                    SizedBox(height: 18.h),

                    _buildSectionTitle1(context, "Sounds Detection"),
                    SizedBox(height: 4.h),
                    _buildInfoRow1(context, "To keep running in low battery, Sleep will stop detection when the battery is below 20% and finish analysis when the battery is below 10%.", soundSettingProvider.soundSettings.sleepAnalysis?.soundsDetection?.enabled ?? false, () => soundDetection(context), themeProvider),
                    Divider(  color: Theme.of(context).colorScheme.onSecondary,),
                    _buildSectionTitle(context, "Soundscapes"),
                    SizedBox(height: 18.h),

                    _buildInfoRow(context, "Soundscapes", "Calm Light", () => soundScape(context), themeProvider),
                    SizedBox(height: 35.h),
                    _buildSectionTitle(context, "Alarm"),
                    _buildSwitchRow(context, "Autoplay sounds while sleeping", soundSettingProvider.soundSettings.soundscapes?.alarmAutoplay ?? false, soundSettingProvider.toggleAutoPlay),
                    SizedBox(height: 21.h),

                    _buildInfoRow(context, "Audio timer", soundSettingProvider.soundSettings.soundscapes?.audioTimer, () => audioTimerBottomSheet(context), themeProvider),
                    Divider(  color: Theme.of(context).colorScheme.onSecondary,),
                    SizedBox(height: 10.h),
                    _buildSectionTitle(context, "Advanced"),
                    SizedBox(height: 21.h),
                    _buildInfoRow(context, "Snooze", soundSettingProvider.soundSettings.advanced?.snooze, () => snoozeBottomSheet(context), themeProvider),
                    SizedBox(height: 24.h),
                    _buildInfoRow(context, "Alarm mode", "Always use", () => alarmMode(context), themeProvider),
                    SizedBox(height: 24.h),
                    _buildInfoRow(context, "Get-up Challenge", "None", () => getChallange(context), themeProvider),
                    SizedBox(height: 18.h),
  Text("the data ${soundSettingProvider.soundSettings.sleepAnalysis?.soundsDetection?.enabled}")
                  ],
                ),
              ),
            );
          },
        ),
      );
    },
  );
}
// Widget _buildVolumeController() {
//   return StatefulBuilder(
//     builder: (context, setState) {
//       double _currentVolume = 0.5;
//       VolumeController().getVolume().then((volume) {
//         setState(() => _currentVolume = volume);
//       });
//       return Column(
//         children: [
//           Text("Volume", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//           Slider(
//             min: 0.0,
//             max: 1.0,
//             value: _currentVolume,
//             onChanged: (value) {
//               setState(() => _currentVolume = value);
//               VolumeController().setVolume(value);
//             },
//           ),
//         ],
//       );
//     },
//   );
// }

/// 🔹 **Header with Back Button & Title**
Widget _buildHeader(BuildContext context, ThemeProvider themeProvider, SoundSettingProvider soundSettingProvider) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      GestureDetector(
        onTap: () {
          soundSettingProvider.saveSettings(); // Save settings before closing
          Navigator.pop(context);
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(
              color: themeProvider.themeMode == ThemeMode.dark ? Colors.white : Colors.black87,
              width: 1,
            ),
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: EdgeInsets.all(7.r),
            child: Icon(
              Icons.arrow_back_ios,
              color: themeProvider.themeMode == ThemeMode.dark ? Colors.white : Colors.black87,
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
        onTap: () async {
         await soundSettingProvider.saveSettings(); // Save settings before closing
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

/// 🔹 **Sound Preview Widget**
Widget _buildSoundPreview(String ringtone) {
  return Container(
    padding: EdgeInsets.all(12.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(14.r),
      color: Colors.grey.shade800,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Ringtone", style: TextStyle(color: Colors.white, fontSize: 12.sp)),
            Text(ringtone, style: TextStyle(color: Colors.white54, fontSize: 10.sp)),
          ],
        ),
        Icon(Icons.music_note, color: Colors.white54),
      ],
    ),
  );
}

Widget _buildSwitchRow(BuildContext context, String label, bool switchValue, Function() onToggle) {
  return Consumer<SoundSettingProvider>(
    builder: (context, provider, child) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 14.sp, fontWeight: FontWeight.w400)),
          SwitchButton(
            isSwitchOn: switchValue,
            onChange: (bool newValue) => onToggle(),
          ),
        ],
      );
    },
  );
}

Widget _buildProgressBar(BuildContext context,themeProvider) {
  return Row(
    children: [
      Icon(Icons.notifications_outlined, color: themeProvider.themeMode == ThemeMode.dark ? Colors.white54  : Colors.black12),
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
Widget _buildSectionTitle(BuildContext context, String title) {
  return Align(
    alignment: Alignment.topLeft,
    child: Text(
      title,
      textAlign: TextAlign.left,
      style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400, fontSize: 12.sp,
        color: Theme.of(context).colorScheme.onSecondary, // Using secondary color

      ),
    ),
  );
}Widget _buildSectionTitle1(BuildContext context, String title) {
  return Align(
    alignment: Alignment.topLeft,
    child: Text(
      title,
      textAlign: TextAlign.left,
      style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400, fontSize: 12.sp,
      //  color: Theme.of(context).colorScheme.onSecondary, // Using secondary color

      ),
    ),
  );
}


Widget _buildInfoRow(BuildContext context, String label, dynamic? value, Function()? onTap, ThemeProvider themeProvider) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(child: Text(label, maxLines: 5, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400, fontSize: 12.sp))),
      if (onTap != null) GestureDetector(onTap: onTap, child: Row(
        children: [
          Text(value.toString()),
          Icon(Icons.arrow_forward_ios_rounded, size: 16, color: themeProvider.themeMode == ThemeMode.dark ? Colors.white : Colors.black87),
        ],
      )),
    ],
  );
}

Widget _buildInfoRow1(BuildContext context, String label, bool value, Function()? onTap, ThemeProvider themeProvider) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: Text(
          label,
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 12.sp,
            color: Theme.of(context).colorScheme.onSecondary, // Using secondary color
          ),
        ),
      ),
      if (onTap != null)
        GestureDetector(
          onTap: onTap,
          child: Row(
            children: [
              Text(value ? "On" : "Off",style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: 12.sp,
                fontWeight: FontWeight.w300
              ),),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16,
                color: themeProvider.themeMode == ThemeMode.dark ? Colors.white : Colors.black87,
              ),
            ],
          ),
        ),
    ],
  );
}

