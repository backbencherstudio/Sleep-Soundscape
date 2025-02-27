import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sleep_soundscape/Utils/route_name.dart';
import 'package:sleep_soundscape/global_widget/custom_button.dart';

import '../../../api_services/local_storage_services.dart';
void signOutBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
    ),
    builder: (BuildContext context) {
      return Container(
        height: MediaQuery.of(context).size.height*0.6,
        decoration: BoxDecoration(
          color: Color(0xff0F0F13),
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        ),
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Ready to  ",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: "Sleep?",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Color(0xffFAD051),
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 12.h),

            // Preferred Earphones
            Align(
              alignment: Alignment.center,
              child: Image.asset("assets/images/question_mark.png",height: 146.h,width: 146.w,),
            ),
            SizedBox(height: 40.h),

            Align(
                alignment: Alignment.center,
                child: CustomButton(text: "Sign out", onPressed: ()async{
                  await  AuthStorageService.removeToken();
                  Navigator.pushNamedAndRemoveUntil(context, RouteName.signInScreen, (_)=>false);

                  debugPrint("Log out Successfully");


                })),
            SizedBox(height: 24.h),
            Align(
                alignment: Alignment.center,
                child: CustomButton(text: "Cancel", onPressed: (){},backgroundColor:Color(0xff19191C),textColor: Colors.white,)),

          ],
        ),
      );
    },
  );
}
