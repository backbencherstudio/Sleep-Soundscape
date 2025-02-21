import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000000),

      body: Center(
        child: Column(
          children: [
            SizedBox(height: 70),
            RichText(
              text: TextSpan(
                text: "Sign ",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontSize: 80.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFFFFFFF),
                ),

                children: <TextSpan>[
                  TextSpan(
                    text: "up",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontSize: 80.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFFAD051),
                    ),
                  ),
                ],
              ),
            ),

            Image.asset("assets/icons/up.png", height: 270.h, width: 270.w),
          ],
        ),
      ),
    );
  }
}
