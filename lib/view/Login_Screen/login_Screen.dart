import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sleep_soundscape/Utils/route_name.dart';
import 'package:sleep_soundscape/view/Login_Screen/Sign_in_Screen.dart';
import 'package:sleep_soundscape/view/Login_Screen/widget/BottomSheet.dart';
import 'package:sleep_soundscape/view/Login_Screen/widget/inputDecoration.dart';
import 'package:sleep_soundscape/view/Login_Screen/widget/myButton.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w),
          child: Column(
            children: [
              RichText(
                text: TextSpan(
                  text: "Sign ",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  //  color: Color(0xFFFFFFFF),
                  ),

                  children: <TextSpan>[
                    TextSpan(
                      text: "up",
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
              SizedBox(height: 24.h),
              GestureDetector(
                onTap: () {},
                child: GestureDetector(
                  onTap: () {
                    showbottomSheet(context: context);
                  },
                  child: Container(
                    padding: EdgeInsets.all(26.r),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                          shape:BoxShape.circle,
                    ),
                    child: Icon(Icons.person_outline,size: 32.r,color: Theme.of(context).colorScheme.onTertiary,),
                  ),
                ),
              ),
              SizedBox(height: 14.h),
              Text(
                "Choose Your Image",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: 32.h),
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
                  context :  context,
                  prefixIcon: Icon(Icons.email_outlined),
                  hintText:   "Enter your email",
                ),
              ),
              SizedBox(height: 16.h),
              TextFormField(
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Color(0xFFFFFFFFF).withOpacity(0.9),
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
              Expanded(child: SizedBox()),

              Mybutton(
                text: "Next",
                color: Theme.of(context).colorScheme.primary,
                ontap: () {
                  Navigator.pushNamed(context, RouteName.completeProfileScreen);

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
               SizedBox(height: 20.h),
              RichText(
                text: TextSpan(
                  text: "Have an account? ",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w300,
                  ),

                  children: <TextSpan>[
                    TextSpan(
                      text: "Sign in",
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium?.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
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

              SizedBox(height: 50.h),
            ],
          ),
        ),
      ),
    );
  }
}
