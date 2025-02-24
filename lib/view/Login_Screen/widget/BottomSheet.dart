import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showbottomSheet({
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
                  Container(
                    height: 6.h,
                    width: 115.w,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 44, 47, 49),
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                  ),
                  SizedBox(height: 20),
                  RichText(
                    text: TextSpan(
                      text: "Choose ",
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium?.copyWith(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFFFFFFF),
                      ),

                      children: <TextSpan>[
                        TextSpan(
                          text: "preference",
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
                  Row(
                    children: [
                      Flexible(
                        child: Image.asset(
                          "assets/icons/Camera.png",
                          width: 142.w,
                          height: 114.h,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Flexible(
                        child: Image.asset(
                          "assets/icons/Gallery.png",
                          width: 142.w,
                          height: 114.h,
                        ),
                      ),
                    ],
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
