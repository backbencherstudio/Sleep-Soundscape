import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sleep_soundscape/model_view/theme_provider.dart';
import '../../../Utils/route_name.dart';
import '../../../global_widget/custom_button.dart';
import '../../../model_view/login_auth_provider.dart';
import '../../../model_view/reminder_screen_provider.dart';
import '../../parent_screen/screen/parent_screen.dart';
import '../../reminder_screen/reminder_widgets/reminder_widgets.dart';
import '../../settings_screens/widgets/setting_bottom_modal_sheet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  final isSelected = false;

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final loginAuthProvider = Provider.of<LoginAuthProvider>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      // Background image and other UI elements.
      body: Stack(
        fit: StackFit.expand,
        children: [
          if(themeProvider.themeMode == ThemeMode.dark)
          Positioned.fill(

            child: Image.asset(
               "assets/images/home_screen_img.png",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // User Info
                  Padding(
                    padding:  EdgeInsets.only(top:20.0),
                    child: ListTile(
                      leading: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, RouteName.profileScreen);
                        },
                        child: ClipOval(
                          child: loginAuthProvider.loginData?.user?.image != null &&
                              loginAuthProvider.loginData!.user!.image!.isNotEmpty
                              ? Image.network(
                            loginAuthProvider.loginData!.user!.image!,
                            height: 35.h,
                            width: 40.w,
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
                          ),
                        ),

                      ),
                      title: Text(
                        loginAuthProvider.loginData?.user!.name ?? "N/A",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 12.sp,
                        ),
                      ),
                      trailing: GestureDetector(
                        onTap: (){
                          debugPrint("\nSwitching theme!\n");
                          context.read<ThemeProvider>().toggleTheme();
                          },
                        child: Container(
                          padding: EdgeInsets.all(4.r),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey, width: 1.0),
                          ),
                          child: themeProvider.themeMode == ThemeMode.dark ?
                          Icon(Icons.dark_mode_outlined
                          ,
                          color: Theme.of(context).colorScheme.onSecondary,
                            size: 15.r,
                          ) :
                          Icon(Icons.light_mode_outlined   ,
                            color: Theme.of(context).colorScheme.onSecondary,
                            size: 15.r,),
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
                  SizedBox(
                    width: 197.w,
                    height: 139.h,
                    child: FittedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ReminderWidgets().buildCupertinoPicker(
                            context,
                            [01, 02, 03, 04, 05, 06, 07, 08, 09, 10, 11, 12],
                            8,
                                (value) {
                              debugPrint("\nValue : $value\n");
                            },
                            false,
                          ),
                          Text(":"),
                          ReminderWidgets().buildCupertinoPicker(
                            context,
                            [
                              1,
                              2,
                              3,
                              4,
                              5,
                              6,
                              7,
                              8,
                              9,
                              10,
                              11,
                              12,
                              13,
                              14,
                              15,
                              16,
                              17,
                              18,
                              19,
                              20,
                              21,
                              22,
                              23,
                              24,
                              25,
                              26,
                              27,
                              28,
                              29,
                              30,
                            ],
                            22,
                                (value) {
                              debugPrint("\nValue : $value\n");
                            },
                            false,
                          ),
                          ReminderWidgets().buildCupertinoPicker(
                            context,
                            ['AM', 'PM'],
                            'PM',
                                (value) {
                              debugPrint("\nValue : $value\n");
                            },
                            true,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 90.h),
                  // Start Button
                  Column(
                    children: [
                      Image.asset(
                        "assets/icons/start_img.png",
                        width: 50,
                        height: 50,
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "Start",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                      ),

                    ],
                  ),

                  SizedBox(height: 42.h,),
                  // Removed Spacer to avoid render errors in a scrollable view.

                ],
              ),
            ),
          ),
          Positioned(
            bottom: 30.h,
            left: 0,
            right: 0,
            child: CustomBottomBar(),
          )
        ],
      ),
    );
  }

  /// **Bottom Sheet**
  void startForReady() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: Color(0xff212121),
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Ready to ",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 20.sp,
                        ),
                      ),
                      TextSpan(
                        text: "Sleep?",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Color(0xffFAD051),
                          fontWeight: FontWeight.w500,
                          fontSize: 20.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),
                Center(
                  child: Image.asset(
                    "assets/images/phone.png",
                    width: 130.w,
                    height: 133.h,
                  ),
                ),
                SizedBox(height: 35.h),
                Text(
                  "Keep the charger connected. Screen down your phone on the bed",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Color.fromRGBO(255, 255, 255, 0.60),
                    fontWeight: FontWeight.w300,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(height: 24.h),
                CustomButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  text: 'Back to Login',
                ),
                SizedBox(height: 24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                      value: true,
                      groupValue: isSelected,
                      onChanged: (value) {
                        // If you want to update the radio button, manage the state appropriately.
                      },
                    ),
                    Text(
                      "Don’t remind me",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Color.fromRGBO(255, 255, 255, 0.60),
                        fontWeight: FontWeight.w300,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
