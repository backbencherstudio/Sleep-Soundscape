import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

import '../widget/parent_screen.dart';
import '../../parent_screen/widget/bottom_navigation_bar.dart';
import '../widget/alarm_setting.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _showStartBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: 200.h,
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        ),
        child: Center(
          child: Text(
            'Start Button Bottom Sheet',
            style: TextStyle(fontSize: 18.sp, color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background image and other UI elements.
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/home_screen_img.png",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
            child: Column(
              children: [
                // User Info
                ListTile(
                  leading: ClipOval(
                    child: Image.asset(
                      "assets/images/user_1.png",
                      height: 32.h,
                      width: 32.w,
                    ),
                  ),
                  title: Text(
                    "Hello Robart",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 12.sp,
                    ),
                  ),
                  trailing: GestureDetector(
                    onTap: () => alarmSetting(context),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xff121221),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey, width: 1.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(9.r),
                        child: Image.asset(
                          "assets/icons/save.png",
                          height: 10.h,
                          width: 10.w,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 110.h),
                // Wake-up Time Text
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Wake up ",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.white,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: "time",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: const Color(0xffFAD051),
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 54.h),
                // Time Picker
                TimePickerSpinner(
                  is24HourMode: false,
                  normalTextStyle: TextStyle(fontSize: 30, color: Colors.white),
                  highlightedTextStyle: TextStyle(
                    fontSize: 40,
                    color: Colors.yellow,
                  ),
                  spacing: 50,
                  itemHeight: 50,
                  onTimeChange: (time) {},
                ),
                SizedBox(height: 102.h),
                // Start Button
                GestureDetector(
                  onTap: _showStartBottomSheet,
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/icons/start_img.png",
                        width: 50,
                        height: 50,
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        "Start",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                const CustomBottomBar(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
