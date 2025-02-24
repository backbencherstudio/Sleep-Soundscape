import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widget/setting_widget.dart';
import '../../../global_widget/switch_button.dart';

class SoundScreen extends StatefulWidget {
  const SoundScreen({super.key});

  @override
  State<SoundScreen> createState() => _SoundScreenState();
}

class _SoundScreenState extends State<SoundScreen> {
  final List<String> categories = ["Oceans", "Nature", "Rain", "Map", "Fire"];
  int selectedIndex = 0; // Track the selected category
  List<bool> isPressedList = List.generate(6, (index) => false); // Track state for each item

  @override
  void initState() {
    super.initState();

}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/home_screen_img.png"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
        child: Column(
          children: [
            /// **Save Icon Positioned at Top Right**
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () => bottomSheetSetting(context),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff121221),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey, width: 1.0),
                  ),
                  padding: EdgeInsets.all(9.r),
                  child: Image.asset(
                    "assets/icons/save.png",
                    height: 12.h,
                    width: 12.w,
                  ),
                ),
              ),
            ),

            Spacer(),

            /// **Time Display**
            RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "04 \n",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                      fontSize: 36.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(
                    text: "20   ",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Color(0xffFAD051),
                      fontSize: 36.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(
                    text: "PM",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),

            /// **Time Container**
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.transparent, width: 1.0),
                borderRadius: BorderRadius.circular(8.r),
                color: Color(0xff0A0F18),
              ),
              padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 13.h),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.alarm,
                    color: Colors.white.withOpacity(0.6),
                    size: 24.sp,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    "8:00 PM",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.white.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ),

            Spacer(),

            /// **Hold to End Button**
            Column(
              children: [
                GestureDetector(
                  // onTap: _bottomSheet,
                  child: Image.asset(
                    "assets/icons/hold.png",
                    width: 56.w,
                    height: 56.h,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  "Hold to end",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.white.withOpacity(0.6),
                    fontWeight: FontWeight.w300,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(height: 20.h),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 60.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14.r),
                    color: Color(0xff0F1618),
                  ),
                  child: ListTile(
                    leading: ClipOval(
                      child: Image.asset('assets/images/calm.png'),
                    ),
                    subtitle: Text("Porem ipsum"),
                    title: Text(
                      "Calm Light",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Color(0xffFFFFFF),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: Image.asset('assets/icons/sart-1.png',width:44 ,height: 44,)
                  ),
                ),
              ],
            ),

            SizedBox(height: 40.h), // Extra spacing at the bottom
          ],
        ),
      ),
    );
  }

  /// **Bottom Sheet Function**


}
