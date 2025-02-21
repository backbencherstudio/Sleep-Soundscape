import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sleep_soundscape/view/Login_Screen/Sign_in_Screen.dart';
import 'package:sleep_soundscape/view/Login_Screen/widget/BottomSheet.dart';
import 'package:sleep_soundscape/view/Login_Screen/widget/inputDecoration.dart';
import 'package:sleep_soundscape/view/Login_Screen/widget/myButton.dart';

class CompleteprofileScreen extends StatelessWidget {
  const CompleteprofileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000000),

      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 24, right: 24),
            child: Column(
              children: [
                RichText(
                  text: TextSpan(
                    text: "Complete ",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFFFFFFF),
                    ),

                    children: <TextSpan>[
                      TextSpan(
                        text: "Profile",
                        style: Theme.of(
                          context,
                        ).textTheme.headlineMedium?.copyWith(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFFAD051),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 26),
                GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    "assets/icons/person.png",
                    height: 86.h,
                    width: 86.w,
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  "Choose Your Image",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
                SizedBox(height: 32.h),
                Container(
                  height: 56.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Color.fromARGB(15, 44, 44, 44).withOpacity(0.8),
                    border: Border.all(color: Color(0xFF4B5155)),
                  ),
                  child: Center(
                    child: Row(
                      children: [
                        SizedBox(width: 16.w),
                        Image.asset("assets/icons/1.png"),
                        SizedBox(width: 8.w),
                        Text(
                          "Robert rollu the move to acyobhbe",
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall!.copyWith(
                            color: Color(0xFFFFFFFFF),
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                Container(
                  height: 56.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Color.fromARGB(15, 44, 44, 44).withOpacity(0.8),
                    border: Border.all(color: Color(0xFF4B5155)),
                  ),
                  child: Center(
                    child: Row(
                      children: [
                        SizedBox(width: 16.w),
                        Image.asset("assets/icons/1.png"),
                        SizedBox(width: 8.w),
                        Text(
                          "kenzi.lawson@example.com",
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall!.copyWith(
                            color: Color(0xFFFFFFFFF),
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 150.h),

                Mybutton(
                  text: "Sign up",
                  color: Color(0xffFAD051),
                  ontap: () {},
                ),
                SizedBox(height: 24.h),

                RichText(
                  text: TextSpan(
                    text: "Have an account? ",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w300,
                      color: Color(0xFFFFFFFF),
                    ),

                    children: <TextSpan>[
                      TextSpan(
                        text: "Sign in",
                        style: Theme.of(
                          context,
                        ).textTheme.headlineMedium?.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w300,
                          color: Color(0xFFFAD051),
                        ),
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignInScreen(),
                                  ),
                                );
                              },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
