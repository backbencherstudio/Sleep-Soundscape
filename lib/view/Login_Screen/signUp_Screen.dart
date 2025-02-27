import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sleep_soundscape/view/Login_Screen/signIN_Screen.dart';
import 'package:sleep_soundscape/view/Login_Screen/widget/BottomSheet.dart';
import 'package:sleep_soundscape/view/Login_Screen/widget/inputDecoration.dart';
import 'package:sleep_soundscape/view/Login_Screen/widget/myButton.dart';
import '../../Utils/route_name.dart';
import '../../model_view/sign-up_provider.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final signUpProvider = Provider.of<SignUpProvider>(context);

    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                RichText(
                  text: TextSpan(
                    text: "Sign ",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
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
                  onTap: () {
                    showbottomSheet(context: context);
                  },
                  child: Container(
                    padding: EdgeInsets.all(26.r),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.person_outline,
                      size: 32.r,
                      color: Theme.of(context).colorScheme.onTertiary,
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
                  controller: nameController,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400),
                  decoration: inputDecoration(
                    context: context,
                    prefixIcon: Icon(Icons.person_outline),
                    hintText: "Enter your name",
                  ),
                ),
                SizedBox(height: 16.h),
                TextFormField(
                  controller: emailController,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400),
                  decoration: inputDecoration(
                    context: context,
                    prefixIcon: Icon(Icons.email_outlined),
                    hintText: "Enter your email",
                  ),
                ),
                SizedBox(height: 16.h),
                TextFormField(
                  controller: passController,
                  obscureText: signUpProvider.isObscure,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400),
                  decoration: inputDecoration(
                    context: context,
                    prefixIcon: Icon(Icons.lock_outline_rounded),
                    hintText: "Enter your password",
                    suffixIcon: IconButton(
                      icon: Icon(
                        signUpProvider.isObscure
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                      ),
                      onPressed: () {
                        signUpProvider.togglePasswordVisibility();
                      },
                    ),
                  ),
                ),
                SizedBox(height: 24.h),

                // Show loading indicator if signup is in progress
                if (signUpProvider.isLoading) CircularProgressIndicator(),

                // Spacer(),
                SizedBox(height: 80.h),

                Mybutton(
                  text: signUpProvider.isLoading ? "Loading..." : "Next",
                  color: signUpProvider.isLoading
                      ? Colors.grey
                      : Theme.of(context).colorScheme.primary,
                  ontap: () async {
                    if (signUpProvider.isLoading) return; // Prevent multiple taps

                    bool success = await signUpProvider.createUser(
                      email: emailController.text.trim(),
                      password: passController.text.trim(),
                      name: nameController.text.trim(),
                    );
                    if (success) {
                      Navigator.pushNamed(context, RouteName.signInScreen);
                    } else {
                      // Show an error message using SnackBar
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(signUpProvider.errorMessage ?? "Signup failed")),
                      );
                    }
                  },
                ),

                SizedBox(height: 20.h),
                RichText(
                  text: TextSpan(
                    text: "Have an account? ",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w300,
                    ),
                    children: [
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
      ),
    );
  }
}
