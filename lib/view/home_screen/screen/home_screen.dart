import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity, // Full width
        height: double.infinity, // Full height
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/home_screen_img.png",
            ), // Your image path
            fit: BoxFit.cover, // Covers the entire screen
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 60.h),
            ListTile(
              leading: ClipOval(
                child: Image.asset("assets/images/user_1.png"),
              ), // Icon on the left
              title: Text(
                "Hello Robart",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Color(0xffFFFFFF),
                  fontWeight: FontWeight.w400,
                  fontSize: 40.sp,
                ),
              ),

              trailing: Container(
                decoration: BoxDecoration(
                  color: const Color(0xff121221),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.grey, // Correct border definition
                    width: 1.0, // Optional, adjust width of border
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(9.r),
                  child: Image.asset("assets/icons/save.png"), // Your image
                ),
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Wake up ",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Color(0xffFFFFFF),
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(
                    text: "time",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Color(0xffFAD051),
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
