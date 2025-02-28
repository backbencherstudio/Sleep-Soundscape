import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sleep_soundscape/global_widget/custom_button.dart';

import '../../../model_view/sound_setting_provider.dart';

void audioTimerBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
    ),
    builder: (BuildContext context) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        ),
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Text(
                "Audio Timer",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 20.h),

            // Snooze Time Dropdown using Consumer
            Align(
              alignment: Alignment.center,
              child: Consumer<SoundSettingProvider>(
                builder: (context, soundSettingProvider, child) {
                  return DropdownButton<int>(
                    value: soundSettingProvider.soundSettings.soundscapes?.audioTimer ?? 1, // Default to 1 min if null
                    items: List.generate(
                      9,
                          (index) => DropdownMenuItem<int>(
                        value: index + 1,
                        child: Text("${index + 1} min"),
                      ),
                    ),
                    onChanged: (newValue) {
                      if (newValue != null) {
                        soundSettingProvider.setAudioTime(newValue); // Update provider state
                      }
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 40.h),

            Align(
              alignment: Alignment.center,
              child: Consumer<SoundSettingProvider>(
                builder: (context, soundSettingProvider, child) {
                  return CustomButton(
                    text: "Save",
                    onPressed: () {
                      Navigator.pop(context, soundSettingProvider.soundSettings.soundscapes?.audioTimer ?? 1); // Return selected snooze time
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 6.h),
          ],
        ),
      );
    },
  );
}
