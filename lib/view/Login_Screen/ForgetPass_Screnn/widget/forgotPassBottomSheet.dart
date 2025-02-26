import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sleep_soundscape/view/Login_Screen/ForgetPass_Screnn/OTP_Screen.dart';
import 'package:sleep_soundscape/view/Login_Screen/widget/myButton.dart';

void ForgotbottomSheet({
  required BuildContext context,
  String? email,
  dynamic Function()? ontap,
}) {
  showModalBottomSheet(
    context: context,
    // backgroundColor: Color(0xFF212121),
    isScrollControlled: true,
    useSafeArea: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(26.r)),
    ),
    builder: (context) {
      return Container(
        width: double.infinity,
        height: 300,
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: Column(
                children: [
                  //=======sheet shutter========
                  Container(
                    height: 6.h,
                    width: 115.w,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 44, 47, 49),
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                  ),
                  ///==================================
                  SizedBox(height: 20),
                  RichText(
                    text: TextSpan(
                      text: "Recovery email ",
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium?.copyWith(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        // color: Color(0xFFFFFFFF),
                      ),
            
                      children: <TextSpan>[
                        TextSpan(
                          text: "sent!",
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
                  SizedBox(height: 18.h),
                  Padding(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: Text(
                      "We have just sent you a recovery email, This ",
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium?.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w300,
                        // color: Color(0xFFFFFFFF).withOpacity(0.6),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                      "email will help you to reset your password",
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium?.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w300,
                        // color: Color(0xFFFFFFFF).withOpacity(0.6),
                      ),
                    ),
                  ),
            
                  SizedBox(height: 20.h),
                  Mybutton(
                    text: "verfify OTP",
                    color: Color(0xFFFAD051),
                    ontap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Otpscreen(email: email!),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
