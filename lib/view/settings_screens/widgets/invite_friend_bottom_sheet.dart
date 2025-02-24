import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sleep_soundscape/Utils/route_name.dart';
import 'package:sleep_soundscape/global_widget/custom_button.dart';

void InviteFriendBottomSheet(BuildContext context) {
  showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10.w),
        topRight: Radius.circular(10.w),
      ),
    ),
    context: context,
    isScrollControlled: true,
    backgroundColor: Color(0xFF0F0F13),
    builder: (context) {
      return SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.9,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(height: 6.h),
              Container(
                width: 115.w,
                height: 6.h,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 0.10),
                  borderRadius: BorderRadius.circular(100.r),
                ),
              ),
              SizedBox(height: 12.h),
              AppBar(
                backgroundColor: Colors.transparent,
                leadingWidth: 32.w,
                leading: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: ImageIcon(
                    AssetImage("assets/icons/back.png"),
                    color: Colors.white,
                    size: 32.r,
                  ),
                ),
                centerTitle: true,
                title: RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontFamily: "Lexend",
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(text: "Get-up  "),
                      TextSpan(
                        text: "Challenge ",
                        style: Theme.of(
                          context,
                        ).textTheme.titleMedium!.copyWith(
                          fontFamily: "Lexend",
                          color: Color(0xFFFAD051),
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 24.h),
                      Text(
                        "Invite friends and get reward",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Color.fromRGBO(255, 255, 255, 0.60),
                          fontFamily: "Lexend",
                          fontWeight: FontWeight.w300,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 32.h),
                      Image.asset(
                        "assets/images/challenge-reward.png",
                        width: 345,
                        height: 330,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(height: 32.h),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Referral code",
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium!.copyWith(
                            fontFamily: "Lexend",
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),

                      SizedBox(height: 12.h),
                      GestureDetector(
                        onTap: (){},
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          width: double.infinity,
                          height: 60.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14.r),
                            border: Border.all(
                              color: Color.fromRGBO(255, 255, 255, 0.08),
                            ),
                            color: Color.fromRGBO(255, 255, 255, 0.04),
                          ),
                          child: Row(
                            children: [
                              Text(
                                "ROBER007",
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyMedium!.copyWith(
                                  color: Color.fromRGBO(255, 255, 255, 0.6),
                                ),
                              ),
                              Spacer(),
                              ImageIcon(
                                AssetImage("assets/icons/copy.png"),
                                size: 24.r,
                                color: Color.fromRGBO(255, 255, 255, 1),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 24.h),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Send or share to your friends",
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium!.copyWith(
                            fontFamily: "Lexend",
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),

                      SizedBox(height: 12.h),
                      shareItemTile(context: context, imagePath: "assets/icons/msg.png",title: "SMS", onTap: (){}),
                      SizedBox(height: 12.h),
                      shareItemTile(context: context, imagePath: "assets/icons/email.png",title: "Email", onTap: (){}),

                      SizedBox(height: 24.h),
                      CustomButton(text: "Done", onPressed: () {}),
                      SizedBox(height: 40.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget shareItemTile({required BuildContext context, required String imagePath, required String title, required VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      width: double.infinity,
      height: 54.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: Color.fromRGBO(255, 255, 255, 0.08)),
        color: Color.fromRGBO(255, 255, 255, 0.04),
      ),
      child: Row(
        children: [
          ImageIcon(
            AssetImage(imagePath),
            size: 18.r,
            color: Color.fromRGBO(255, 255, 255, 1),
          ),
          SizedBox(width: 8.w),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Color.fromRGBO(255, 255, 255, 1),
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: ImageIcon(
              AssetImage("assets/icons/arrow-right.png"),
              size: 24.r,
              color: Color.fromRGBO(255, 255, 255, 1),
            ),
          ),
        ],
      ),
    ),
  );
}
