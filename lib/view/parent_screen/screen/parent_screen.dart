import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sleep_soundscape/view/home_screen/widget/alarm_setting.dart';

import '../../../model_view/parent_screen_provider.dart';
import '../../../model_view/theme_provider.dart';
import '../../sounds_screen/widget/audio_timer_bottom_sheet.dart';
import '../../sounds_screen/widget/sound_bottom_sheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    return Container(
      margin: EdgeInsets.only(bottom: 15.h, left: 15.w, right: 15.w),
     // height: 72.h,
      width: 320.w, // Ensure this width works well with your screen size.
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        border: Border.all(color: Theme.of(context).colorScheme.onSecondary.withOpacity(0.04)),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildNavItem(
            context,
            index: 0,
            icon: Icons.alarm,
            label: AppLocalizations.of(context)!.alarm,
          ),
          _buildNavItem(
            context,
            index: 1,
            icon: Icons.surround_sound_sharp,
            label: AppLocalizations.of(context)!.sounds,
          ),
          _buildNavItem(
            context,
            index: 3,
            icon: Icons.alarm_on_rounded,
            label: AppLocalizations.of(context)!.audio,
          ),
        ],
      ),
    );
  }

  /// Reusable method to build each bottom navigation item.
  Widget _buildNavItem(BuildContext context,
      {required int index, required IconData icon, required String label}) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          // Open corresponding bottom sheet based on index.
          if (index == 0) {
            alarmSetting(context);
          } else if (index == 1) {
            soundBottomSheet(context);
          } else if (index == 3) {
            audioTimerBottomSheet(context);
          }
          // Update the provider with the selected index.
          context.read<ParentScreensProvider>().onSelectedIndex(index);
        },
        child: Consumer<ParentScreensProvider>(
          builder: (_, provider, child) {
            bool isSelected = provider.selectedIndex == index;
            return Container(
            //  height: 69.h,
              margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                // Optionally add a shadow if selected
                boxShadow: isSelected ? [] : [],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    label,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
