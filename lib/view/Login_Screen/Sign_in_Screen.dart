import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sleep_soundscape/view/Login_Screen/completeProfile_Screen.dart';
import 'package:sleep_soundscape/view/Login_Screen/widget/BottomSheet.dart';
import 'package:sleep_soundscape/view/Login_Screen/widget/inputDecoration.dart';
import 'package:sleep_soundscape/view/Login_Screen/widget/myButton.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
                    text: "Sign ",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFFFFFFF),
                    ),

                    children: <TextSpan>[
                      TextSpan(
                        text: "In",
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
                SizedBox(height: 56.h),

                TextFormField(
                  decoration: inputDecoration(
                    context,
                    Image.asset(
                      "assets/icons/1.png",
                      height: 18.h,
                      width: 18.w,
                    ),
                    "Enter your name",
                    null,
                  ),
                ),

                SizedBox(height: 16.h),
                TextFormField(
                  decoration: inputDecoration(
                    context,
                    Image.asset(
                      "assets/icons/3.png",
                      height: 18.h,
                      width: 18.w,
                    ),
                    "Enter your password",
                    Icon(
                      Icons.visibility_off_outlined,
                      color: Color(0xFF4B5155),
                    ),
                  ),
                ),
                SizedBox(height: 12.h),

                GestureDetector(
                  onTap: () {},
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Forgot Password?",

                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium?.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w300,
                        color: Color(0xFFFAD051),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 79.h),

                Mybutton(
                  text: "Sign in",
                  color: Color(0xffFAD051),
                  ontap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CompleteprofileScreen(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Divider(
                        color: Color.fromARGB(255, 156, 141, 141),
                        thickness: 2.0,
                      ),
                    ),
                    SizedBox(width: 8.h),
                    Text(
                      "or",
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium?.copyWith(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                    SizedBox(width: 8.h),
                    Flexible(
                      child: Divider(
                        color: Color.fromARGB(255, 156, 141, 141),
                        thickness: 2.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/icons/google.png",
                      height: 64.h,
                      width: 64.w,
                    ),
                    SizedBox(width: 16.w),
                    Image.asset(
                      "assets/icons/apple.png",
                      height: 64.h,
                      width: 64.w,
                    ),
                  ],
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
