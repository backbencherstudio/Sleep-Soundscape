import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sleep_soundscape/model_view/profile_screen_provider.dart';
import 'package:sleep_soundscape/model_view/theme_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SleepPhaseHeatmap extends StatelessWidget {
  const SleepPhaseHeatmap({super.key});

  @override
  Widget build(BuildContext context) {
    // final profileScreenProvider = context.watch<ProfileScreenProvider>(); // ✅ Watch provider
    //
    // // Prepare data for heatmap
    // Map<DateTime, int> usageData = {
    //   DateTime.now(): _getUsageLevel(profileScreenProvider.dailyUsageMinutes),
    //   DateTime(2025,1,16): 2,
    //   DateTime(2025,2,19): 2,
    //   DateTime(2025,2,20): 4,
    //   DateTime(2025,2,22): 6,
    //   DateTime(2025,2,19): 2,
    //   DateTime(2025,2,23): 2,
    // };

    final profileScreenProvider = context.watch<ProfileScreenProvider>();

    // Convert stored usage data to DateTime format for heatmap
    Map<DateTime, int> usageData = {
      for (var entry in profileScreenProvider.dailyUsageMap.entries)
        DateTime.parse(entry.key): profileScreenProvider.getUsageLevel(entry.value),
    };

    return Container(
      width: double.infinity,
      height: 280.h,
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      decoration: BoxDecoration(
        color: context.watch<ThemeProvider>().isDarkMode? Color.fromRGBO(255, 255, 255, 0.04) : Color.fromRGBO(0, 0, 0, 0.04),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 14.h),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                   AppLocalizations.of(context)!.sleepPhase,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            SizedBox(height: 32.h),
            Text(
              "20",
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontSize: 24.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xFFFAD051),
              ),
            ),
            Text(
              "Days",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w500,
                color: const Color(0xFFFAD051),
              ),
            ),
            SizedBox(height: 24.h),
            Expanded(
              child: Column(
                children: [
                  HeatMap(
                    startDate: DateTime(DateTime.now().year, DateTime.now().month - 3, DateTime.now().day),
                    endDate: DateTime.now(),
                    borderRadius: 2.r,
                    size: 12.r,
                    margin: EdgeInsets.symmetric(horizontal: 2.5.w, vertical: 2.5.h),
                    defaultColor: context.watch<ThemeProvider>().isDarkMode ?  const Color.fromRGBO(255, 255, 255, 0.04) : const Color.fromRGBO(0, 0, 0, 0.04),
                    // colorMode: ColorMode.color,
                    showText: false,
                    textColor: context.watch<ThemeProvider>().isDarkMode ? const Color.fromRGBO(255, 255, 255, 0.4) : const Color.fromRGBO(0, 0, 0, 0.4),
                    scrollable: true,
                    showColorTip: false,
                    datasets: usageData, // ✅ Updated to use provider data
                    colorsets: {
                      1: Colors.yellow.withOpacity(0.25),
                      2: Colors.yellow.withOpacity(0.5),
                      3: Colors.yellow.withOpacity(0.75),
                      4: Colors.yellow.withOpacity(1.0),
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Function to map daily usage minutes to heatmap levels
  int _getUsageLevel(int minutes) {
    if (minutes < 60) return 1;
    if (minutes < 120) return 2;
    if (minutes < 180) return 3;
    return 4;
  }
}
