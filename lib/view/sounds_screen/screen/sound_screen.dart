import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SoundScreen extends StatelessWidget {
  const SoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          /// **Background Image**
          Image.asset(
            "assets/images/home_screen_img.png",
            fit: BoxFit.cover,
          ),

          /// **Save Icon Positioned at Top Right**
          Positioned(
            top: 40.h,
            right: 20.w,
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xff121221),
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
              padding: EdgeInsets.all(9.r),
              child: Image.asset(
                "assets/icons/save.png",
                height: 12.h,
                width: 12.w,
              ),
            ),
          ),

          /// **Main Content Centered**
          Positioned(
            top: 200.h,
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// **Time Display**
                RichText(
                  textAlign: TextAlign.center,
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
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20.h),

                /// **Time Container**
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white.withOpacity(0.6),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.r),
                    color: Color(0xff0A0F18),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 13.h),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.alarm, color: Colors.white.withOpacity(0.6), size: 24.sp),
                      SizedBox(width: 8.w),
                      Text(
                        "8:00 PM",
                        style: TextStyle(fontSize: 16.sp, color: Colors.white.withOpacity(0.6)),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 100.h),

                /// **Hold to End Button**
                Image.asset("assets/icons/hold.png", width: 56.w, height: 56.h),
                SizedBox(height: 8.h),
                Text(
                  "Hold to end",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.white.withOpacity(0.6),
                    fontWeight: FontWeight.w300,
                    fontSize: 14.sp,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
