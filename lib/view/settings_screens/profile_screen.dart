import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sleep_soundscape/model_view/login_auth_provider.dart';
import 'package:sleep_soundscape/model_view/theme_provider.dart';
import 'package:sleep_soundscape/view/reminder_screen/reminder_widgets/reminder_widgets.dart';
import 'package:sleep_soundscape/view/settings_screens/widgets/edit_profile_bottom_sheet.dart';
import 'package:sleep_soundscape/view/settings_screens/widgets/setting_bottom_modal_sheet.dart';
import 'package:sleep_soundscape/view/settings_screens/widgets/sleep_phase_heat_map.dart';
import '../../api_services/local_storage_services.dart';
import '../reminder_screen/reminder_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final loginAuthProvider = Provider.of<LoginAuthProvider>(context, listen: false);

      debugPrint("User name: ${loginAuthProvider.loginData?.user?.name}");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 56.w,
        surfaceTintColor: Colors.transparent,
        leading: Padding(
          padding: EdgeInsets.only(left: 24.0.w),
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: ImageIcon(AssetImage("assets/icons/back.png")),
          ),
        ),
        actionsPadding: EdgeInsets.only(right: 24.w),
        actions: [
          GestureDetector(
            onTap: () => settingBottomModalSheet(context),
            child: Container(
              width: 32.w,
              height: 32.h,
              padding: EdgeInsets.all(7.r),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSecondary.withOpacity(0.08),
                ),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.settings,
                color: Theme.of(context).colorScheme.onSecondary,
                size: 18.r,
              ),
            ),
          ),

          // GestureDetector(
          //   onTap: () => settingBottomModalSheet(context),
          //   child: ImageIcon(
          //     AssetImage("assets/icons/settings.png"),
          //     size: 32.r,
          //     color: Theme.of(context).appBarTheme.actionsIconTheme?.color,
          //   ),
          // ),
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
                    ClipOval(
                      child: FutureBuilder<String?>(
                        future: AuthStorageService.getImage(),
                        builder: (context, snapshot) {
                          String? imageUrl = snapshot.data;

                          return imageUrl != null && imageUrl.isNotEmpty
                              ? Image.network(
                            imageUrl,
                            height: 45.h,
                            width: 55.w,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                "assets/images/default_profile_pic.png",
                                height: 35.h,
                                width: 40.w,
                                fit: BoxFit.cover,
                              );
                            },
                          )
                              : Image.asset(
                            "assets/images/default_profile_pic.png",
                            height: 35.h,
                            width: 40.w,
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FutureBuilder<String?>(
                          future: AuthStorageService.getName(),
                          builder: (context, snapshot) => Text(
                            snapshot.data ?? "N/A",
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 12.sp),
                          ),
                        ),

                        SizedBox(width: 8.h),


                        Text(
                          AppLocalizations.of(context)!.joined2DaysAgo,  // local=====
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall!.copyWith(
                            // color: Color.fromRGBO(255, 255, 255, 0.60),
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
                        color:
                            context.watch<ThemeProvider>().isDarkMode
                                ? Colors.white
                                : Colors.black,
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
                SleepPhaseHeatmap(),
                SizedBox(height: 12.h),
                buildButtonTile(
                  context: context,
                  imagePath: "assets/icons/notification.png",
                  title:    AppLocalizations.of(context)!.reminder,
                  onTap: () {
                    //context.read<ReminderScreenProvider>().setPageID(1);
                    ReminderWidgets.reminderBottomSheet(
                      context: context,
                      widgetToShowInBottomSheet: ReminderScreen(),
                    );
                  },
                ),
                SizedBox(height: 12.h),
                buildButtonTile(
                  context: context,
                  imagePath: "assets/icons/download.png",
                  title:    AppLocalizations.of(context)!.download,
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
          color:
              context.watch<ThemeProvider>().isDarkMode
                  ? Color.fromRGBO(255, 255, 255, 0.04)
                  : Color.fromRGBO(0, 0, 0, 0.04),
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(
            color:
                context.watch<ThemeProvider>().isDarkMode
                    ? Color.fromRGBO(255, 255, 255, 0.08)
                    : Color.fromRGBO(0, 0, 0, 0.08),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageIcon(
              AssetImage(imagePath),
              color:
                  context.watch<ThemeProvider>().isDarkMode
                      ? Colors.white
                      : Colors.black,
              size: 18.r,
            ),
            SizedBox(width: 6.w),
            Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w300),
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
        color:
            context.watch<ThemeProvider>().isDarkMode
                ? Color.fromRGBO(255, 255, 255, 0.04)
                : Colors.black.withOpacity(0.04),
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(
          color:
              context.watch<ThemeProvider>().isDarkMode
                  ? Color.fromRGBO(255, 255, 255, 0.08)
                  : Colors.black.withOpacity(0.08),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(   AppLocalizations.of(context)!.today, style: Theme.of(context).textTheme.bodyLarge),
              Spacer(),
              ImageIcon(
                AssetImage("assets/icons/arrow-right.png"),
                size: 24.r,
                color:
                    context.watch<ThemeProvider>().isDarkMode
                        ? Colors.white
                        : Colors.black,
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              Text(
                   AppLocalizations.of(context)!.sleep,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400),
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
                          style: Theme.of(context).textTheme.bodySmall!
                              .copyWith(fontWeight: FontWeight.w300),
                        ),
                        TextSpan(
                          text: " min",
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall!.copyWith(
                            // color: Color.fromRGBO(255, 255, 255, 0.50),
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                       AppLocalizations.of(context)!.todaySleep,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      // color: Color.fromRGBO(255, 255, 255, 0.50),
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
                  color:
                      context.watch<ThemeProvider>().isDarkMode
                          ? Color.fromRGBO(255, 255, 255, 0.5)
                          : Color.fromRGBO(0, 0, 0, 0.5),
                  thickness: 1,
                ),
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "0",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                      AppLocalizations.of(context)!.sleepQuality, 
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      // color: Color.fromRGBO(255, 255, 255, 0.50),
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
