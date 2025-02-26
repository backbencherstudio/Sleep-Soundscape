import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sleep_soundscape/Utils/route_name.dart';
import 'package:sleep_soundscape/view/Login_Screen/completeProfile_Screen.dart';
import 'package:sleep_soundscape/view/Login_Screen/forgotPassword_Screen.dart';
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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w,top: 16.h),
          child: Column(
            children: [
           Text("Sign In",
           style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w500
           ),),
              SizedBox(height: 56.h),

              TextFormField(
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w400
                ),
                decoration: inputDecoration(
                  context : context,
                  prefixIcon: Icon(Icons.person_outline),
                  hintText:"Enter your name",
                ),
              ),

              SizedBox(height: 16.h),
              TextFormField(
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    // color: Color(0xFFFFFFFFF).withOpacity(0.9),
                    fontWeight: FontWeight.w400
                ),
                decoration: inputDecoration(
                  context : context,
                  prefixIcon:  Icon(Icons.lock_outline_rounded),
                  hintText:   "Enter your password",
                  suffixIcon:   Icon(
                    Icons.visibility_outlined,
                  ),
                ),
              ),
              SizedBox(height: 12.h),

              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ForgotpasswordScreen(),
                    ),
                  );
                },
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forgot Password?",

                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Expanded(child: SizedBox()),

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
                  Navigator.pushNamedAndRemoveUntil(context, RouteName.homeScreen, (_)=>false);
                },
              ),
              // SizedBox(height: 24.h),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Flexible(
              //       child: Divider(
              //         color: Color.fromARGB(255, 156, 141, 141),
              //         thickness: 2.0,
              //       ),
              //     ),
              //     SizedBox(width: 8.h),
              //     Text(
              //       "or",
              //       style: Theme.of(
              //         context,
              //       ).textTheme.headlineMedium?.copyWith(
              //         fontSize: 18.sp,
              //         fontWeight: FontWeight.w500,
              //         color: Color(0xFFFFFFFF),
              //       ),
              //     ),
              //     SizedBox(width: 8.h),
              //     Flexible(
              //       child: Divider(
              //         color: Color.fromARGB(255, 156, 141, 141),
              //         thickness: 2.0,
              //       ),
              //     ),
              //   ],
              // ),
              // SizedBox(height: 32.h),
              //
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Image.asset(
              //       "assets/icons/google.png",
              //       height: 64.h,
              //       width: 64.w,
              //     ),
              //     SizedBox(width: 16.w),
              //     Image.asset(
              //       "assets/icons/apple.png",
              //       height: 64.h,
              //       width: 64.w,
              //     ),
              //   ],
              // ),
              SizedBox(height: 24.h),
              RichText(
                text: TextSpan(
                  text: "Have an account? ",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w300,
                  ),

                  children: <TextSpan>[
                    TextSpan(
                      text: "Sign up",
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium?.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = (){
                          Navigator.pushNamedAndRemoveUntil(context, RouteName.signUpScreen, (_)=>false);
                        }
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h,)
            ],
          ),
        ),
      ),
    );
  }
}
