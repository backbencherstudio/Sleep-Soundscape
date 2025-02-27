import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sleep_soundscape/view/Login_Screen/signIN_Screen.dart';
import 'package:sleep_soundscape/view/Login_Screen/widget/inputDecoration.dart';
import 'package:sleep_soundscape/view/Login_Screen/widget/myButton.dart';


import '../../Utils/route_name.dart';

class CompleteprofileScreen extends StatelessWidget {
  const CompleteprofileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w,bottom: 20.h,top: 10.h),
          child: Column(
            children: [
              RichText(
                text: TextSpan(
                  text: "Complete ",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
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
              SizedBox(height: 24),
              Image.asset(
                "assets/icons/person.png",
                height: 86.h,
                width: 86.w,
              ),
              SizedBox(height: 10.h),
              Text(
                "Choose Your Image",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: 32.h),
              TextFormField(
                enabled: false,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Color(0xFFFFFFFFF).withOpacity(0.9),
                    fontWeight: FontWeight.w400
                ),
                decoration: inputDecoration(
                  context : context,
                  prefixIcon: Icon(Icons.person_outline),
                  hintText:"Nahidul Islam Shakin",
                ),
              ),
              // Container(
              //   height: 56.h,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(14),
              //     color: Colors.white.withOpacity(0.04),
              //     border: Border.all(color: Colors.white.withOpacity(0.08)),
              //   ),
              //   child: Center(
              //     child: Row(
              //       children: [
              //         SizedBox(width: 16.w),
              //         Image.asset("assets/icons/1.png"),
              //         SizedBox(width: 8.w),
              //         Text(
              //           "Nahidul Islam Shakin",
              //           style: Theme.of(context).textTheme.bodyMedium!
              //               .copyWith(color: Colors.white.withOpacity(0.6)),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              SizedBox(height: 16.h),
              TextFormField(
                enabled: false,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Color(0xFFFFFFFFF).withOpacity(0.9),
                    fontWeight: FontWeight.w400
                ),
                decoration: inputDecoration(
                  context : context,
                  prefixIcon: Icon(Icons.person_outline),
                  hintText:"shakinhabib2000@gmail.com",
                ),
              ),
              Expanded(child: SizedBox(height: 79.h)),

              Mybutton(
                text: "Sign up",
                color: Theme.of(context).colorScheme.primary,
                ontap: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    RouteName.goalScreen,
                        (_) => false,
                  );
                },
              ),
              SizedBox(height: 20.h),

              RichText(
                text: TextSpan(
                  text: "Have an account? ",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                    // color: Color(0xFFFFFFFF),
                  ),

                  children: <TextSpan>[
                    TextSpan(
                      text: "Sign in",
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium?.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                       // color: Color(0xFFFAD051),
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
    );
  }
}
