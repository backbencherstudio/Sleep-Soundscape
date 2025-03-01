import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../Utils/route_name.dart';
import '../../model_view/sign-up_provider.dart';
import '../Login_Screen/signIN_Screen.dart';
import '../Login_Screen/widget/myButton.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final signUpProvider = Provider.of<SignUpProvider>(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 40.h),
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
                onTap: () async {
                  final pickedFile = await ImagePicker().pickImage(
                    source: ImageSource.gallery,
                  );
                  if (pickedFile != null) {
                    signUpProvider.setImage(File(pickedFile.path));
                  }
                },
                child: CircleAvatar(
                  radius: 40.r,
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  backgroundImage:
                      signUpProvider.selectedImage != null
                          ? FileImage(signUpProvider.selectedImage!)
                          : null,
                  child:
                      signUpProvider.selectedImage == null
                          ? Icon(
                            Icons.person_outline,
                            size: 32.r,
                            color: Colors.white,
                          )
                          : null,
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
                decoration: InputDecoration(labelText: "Enter your name"),
              ),
              SizedBox(height: 16.h),

              TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: "Enter your email"),
              ),
              SizedBox(height: 16.h),

              TextFormField(
                controller: passController,
                obscureText: signUpProvider.isObscure,
                decoration: InputDecoration(
                  labelText: "Enter your password",
                  suffixIcon: IconButton(
                    icon: Icon(
                      signUpProvider.isObscure
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                    onPressed: signUpProvider.togglePasswordVisibility,
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              TextFormField(
                controller: confirmController,
                obscureText: signUpProvider.isObscure,
                decoration: InputDecoration(
                  labelText: "Confirm password",
                  suffixIcon: IconButton(
                    icon: Icon(
                      signUpProvider.isObscure
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                    onPressed: signUpProvider.togglePasswordVisibility,
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              Mybutton(
                text: signUpProvider.isLoading ? "Loading..." : "Next",
                color:
                    signUpProvider.isLoading
                        ? Colors.grey
                        : Theme.of(context).colorScheme.primary,
                ontap:
                    signUpProvider.isLoading
                        ? null
                        : () async {
                          if (passController.text.trim() !=
                              confirmController.text.trim()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Passwords do not match")),
                            );
                            return;
                          }

                          bool success = await signUpProvider.createUser(
                            name: nameController.text.trim(),
                            email: emailController.text.trim(),
                            password: passController.text.trim(),
                          );

                          if (success) {
                            nameController.clear();
                            emailController.clear();
                            passController.clear();
                            confirmController.clear();

                            Navigator.pushNamed(context, RouteName.homeScreen);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  signUpProvider.errorMessage ??
                                      "Signup failed",
                                ),
                              ),
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
    );
  }
}
