import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sleep_soundscape/view/Feedback_Screen/widget/customBox.dart';
import 'package:sleep_soundscape/view/Feedback_Screen/widget/inputdecor.dart';
import 'package:sleep_soundscape/view/Login_Screen/widget/myButton.dart';

void showFeedbackSheet({
  required BuildContext context,
  dynamic Function()? ontap,
}) {
  showModalBottomSheet(
    context: context,

    backgroundColor: Color(0xFF212121),
    isScrollControlled: true,
    useSafeArea: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(26.r)),
    ),
    builder: (context) {
      return Container(
        width: double.infinity,
        height: 830,
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
                  Container(
                    height: 6.h,
                    width: 115.w,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 44, 47, 49),
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 18.h,
                        width: 18.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,

                          border: Border.all(
                            color: const Color.fromARGB(255, 126, 126, 126),
                            width: 1,
                          ),
                        ),

                        child: Image.asset("assets/icons/cancel.png"),
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  RichText(
                    text: TextSpan(
                      text: "User Feedback",
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium?.copyWith(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),

                  Text(
                    "Any problems faced so far?",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w300,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                  SizedBox(height: 52.h),
                  SizedBox(
                    width: 260.w,
                    child: Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        Custombox(text: "Slow loading"),
                        Custombox(text: "Customer service"),

                        Custombox(text: "App crash"),
                        Custombox(text: "Navigation"),
                        Custombox(text: "Navigation"),
                        Custombox(text: "Not functional"),
                        Custombox(text: "Security issues"),
                      ],
                    ),
                  ),
                  SizedBox(height: 32.h),
                  SizedBox(
                    width: 345.w,
                    height: 194.h,

                    child: TextFormField(
                      expands: true,
                      maxLines: null,
                      textAlignVertical: TextAlignVertical.top,
                      decoration: inputDecoration2(
                        context,
                        null,
                        "Write a review here..",
                        Image.asset(
                          "assets/icons/pencil.png",
                          height: 16.h,
                          width: 16.w,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),

                  Mybutton(
                    text: "Next",
                    color: Color(0xFFFAD051),
                    ontap: () {},
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
