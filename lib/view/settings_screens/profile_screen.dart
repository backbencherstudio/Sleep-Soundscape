import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sleep_soundscape/model_view/reminder_screen_provider.dart';
import 'package:sleep_soundscape/view/reminder_screen/reminder_widgets/reminder_widgets.dart';
import 'package:sleep_soundscape/view/settings_screens/widgets/edit_profile_bottom_sheet.dart';
import 'package:sleep_soundscape/view/settings_screens/widgets/setting_bottom_modal_sheet.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Map<DateTime, int> _data = {};

  @override
  void initState() {
    _initExampleData();
    super.initState();
  }

  void _initExampleData() {
    var rng = Random();
    var now = DateTime.now();
    var today = DateTime(now.year, now.month, now.day);
    for (int i = 0; i < 200; i++) {
      DateTime date = today.subtract(Duration(days: i));
      _data[date] = rng.nextInt(6); // Random number between 0 and 5
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000000),
      appBar: AppBar(
        leadingWidth: 56.w,
        backgroundColor: Colors.black,
        surfaceTintColor: Colors.transparent,
        leading: Padding(
          padding: EdgeInsets.only(left: 24.0.w),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: ImageIcon(
              AssetImage("assets/icons/back.png"),
              size: 32.r,
              color: Colors.white,
            ),
          ),
        ),
        actionsPadding: EdgeInsets.only(right: 24.w),
        actions: [
          GestureDetector(
            onTap: () => settingBottomModalSheet(context),

            child: ImageIcon(
              AssetImage("assets/icons/settings.png"),
              size: 32.r,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 32.h),
                Row(
                  children: [
                    Container(
                      width: 80.w,
                      height: 80.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage("assets/images/user_1.png"),
                          fit: BoxFit.cover,
                          onError: (_, __) {
                            AssetImage("assets/icons/profile.png");
                          },
                        ),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Column(
                      children: [
                        Text(
                          "Rober Fox",
                          style: Theme.of(
                            context,
                          ).textTheme.titleMedium!.copyWith(
                            fontFamily: "Lexend",
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 6.h),
                        Text(
                          "Joined 2 days ago",
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall!.copyWith(
                            color: Color.fromRGBO(255, 255, 255, 0.60),
                            fontWeight: FontWeight.w300,
                            fontFamily: "Lexend",
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        EditProfileBottomSheet(context);
                      },
                      child: ImageIcon(
                        AssetImage("assets/icons/edit.png"),
                        color: Colors.white,
                        size: 32.r,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                // SubscribeTile(),
                // SizedBox(height: 12.h),
                buildTodaySleepInfoTile(context),
                SizedBox(height: 12.h),
                Container(
                  width: double.infinity,
                  height: 280.h,
                  padding: EdgeInsets.symmetric(horizontal: 14.w),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 0.04),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 14.h.h,),
                        Align(alignment: Alignment.centerLeft, child: Text("Sleep Phase",style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.white
                        ),)),
                        SizedBox(height: 32.h,),

                         Text(
                          "20",
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFFAD051),
                          ),
                        ),
                         Text(
                          "Days",
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFFAD051),
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
                                margin: EdgeInsets.symmetric(horizontal: 2.5.w,vertical: 2.5.h),
                                defaultColor: Color.fromRGBO(255, 255, 255, 0.04,),
                                colorMode: ColorMode.color,
                                showText: false,
                                textColor: Color.fromRGBO(255, 255, 255, 0.4),
                                scrollable: true,
                                showColorTip: false,
                                datasets: _data,
                                colorsets: {
                                  1: Colors.amber.shade200,
                                  // 2: Colors.amber.shade400,
                                  // 3: Colors.amber.shade600,
                                },
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                buildButtonTile(
                  context: context,
                  imagePath: "assets/icons/notification.png",
                  title: "Reminder",
                  onTap: () {
                    context.read<ReminderScreenProvider>().setPageID(1);
                    ReminderWidgets().reminderBottomSheet(context);
                  },
                ),
                SizedBox(height: 12.h),
                buildButtonTile(
                  context: context,
                  imagePath: "assets/icons/download.png",
                  title: "Download",
                  onTap: () {},
                ),
                SizedBox(height: 32.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildButtonTile({
    required BuildContext context,
    required String imagePath,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 56.h,
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 0.04),
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(color: Color.fromRGBO(255, 255, 255, 0.08)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageIcon(AssetImage(imagePath), color: Colors.white, size: 18.r),
            SizedBox(width: 6.w),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildTodaySleepInfoTile(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100.h,
      padding: EdgeInsets.symmetric(horizontal: 12.r),
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 0.04),
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: Color.fromRGBO(255, 255, 255, 0.08)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(
                "Today",
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge!.copyWith(color: Colors.white),
              ),
              Spacer(),
              ImageIcon(
                AssetImage("assets/icons/arrow-right.png"),
                size: 24.r,
                color: Colors.white,
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              Text(
                "Sleep",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: "0",
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        TextSpan(
                          text: " min",
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall!.copyWith(
                            color: Color.fromRGBO(255, 255, 255, 0.50),
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    "Today sleep",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Color.fromRGBO(255, 255, 255, 0.50),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
              Spacer(),
              SizedBox(
                height: 34,
                width: 1.w,
                child: VerticalDivider(
                  color: Color.fromRGBO(255, 255, 255, 0.5),
                  thickness: 0,
                ),
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "0",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    "Sleep quality",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Color.fromRGBO(255, 255, 255, 0.50),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 20.w),
            ],
          ),
        ],
      ),
    );
  }
}
