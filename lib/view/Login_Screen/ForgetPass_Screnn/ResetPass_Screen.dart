import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sleep_soundscape/model_view/ForgetPass_provider.dart';
import 'package:sleep_soundscape/model_view/sign-up_provider.dart';
import 'package:sleep_soundscape/view/Login_Screen/signIN_Screen.dart';
import 'package:sleep_soundscape/view/Login_Screen/signUp_Screen.dart';
import 'package:sleep_soundscape/view/Login_Screen/widget/inputDecoration.dart';
import 'package:sleep_soundscape/view/Login_Screen/widget/myButton.dart';

// ignore: must_be_immutable
class ResetpassScreen extends StatefulWidget {
  String email;
  String otp;
   ResetpassScreen({
    required this.email,
    required this.otp,
    super.key});

  @override
  State<ResetpassScreen> createState() => _ResetpassScreenState();
}

class _ResetpassScreenState extends State<ResetpassScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
           final loginProvider = Provider.of<SignUpProvider>(context);

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 24, right: 24),
            child: Column(
              children: [
                SizedBox(height: 35),
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignInScreen()),
                      );
                    },
                    child: Container(
                      height: 32.h,
                      width: 32.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Color(0xFF4B5155)),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Color(0xFF4B5155),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40.h),
                RichText(
                  text: TextSpan(
                    text: "Reset your Password ",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                     
                    ),

                    children: <TextSpan>[
                      TextSpan(
                        text: "Password?",
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
                  padding: EdgeInsets.only(left: 18, right: 18),
                  child: Text(
                    "Please enter your e-mail address below to",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w300,
                      
                    ),
                  ),
                ),
                Padding(
                 
                  padding: EdgeInsets.only(left: 18, right: 18),
                  child: Text(
                    "reset your password.",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w300,
                    
                    ),
                  ),
                ),
                SizedBox(height: 32.h),
   TextFormField(
                        obscureText: loginProvider.isObscure,

    controller: passwordController,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    // color: Color(0xFFFFFFFFF).withOpacity(0.9),
                    fontWeight: FontWeight.w400
                ),
                decoration: inputDecoration(
                  context : context,
                  prefixIcon:  Icon(Icons.lock_outline_rounded),
                  hintText:   "Enter your new password",
                  suffixIcon: GestureDetector(
                      onTap: () {
                         loginProvider.togglePasswordVisibility();
                      },
                      child: Icon(loginProvider.isObscure ? Icons.visibility_off_outlined : Icons.visibility_outlined),
                  ),
                ),
              ),
              SizedBox(height: 10.h,),
    TextFormField(
                          obscureText: loginProvider.isObscure,

      controller: confirmPassController,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    // color: Color(0xFFFFFFFFF).withOpacity(0.9),
                    fontWeight: FontWeight.w400
                ),
                decoration: inputDecoration(
                  context : context,
                  prefixIcon:  Icon(Icons.lock_outline_rounded),
                  hintText:   "Confirm your password",
                 suffixIcon: GestureDetector(
                      onTap: () {
                         loginProvider.togglePasswordVisibility();
                      },
                      child: Icon(loginProvider.isObscure ? Icons.visibility_off_outlined : Icons.visibility_outlined),
                  ),
                ),
              ),
                SizedBox(height: 290.h),
Consumer<ForgetPassProvider>(
                  builder: (context, forgetPassProviderprovider, child) {
                    return forgetPassProviderprovider.isLoading
                        ? CircularProgressIndicator()
                        : Mybutton(
                            text: "Done",
                            color: Color(0xffFAD051),
                           ontap: () async {
  if (passwordController.text != confirmPassController.text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text("Passwords don't match"),
      ),
    );
    return; 
  }
                             await forgetPassProviderprovider.resetPassword(
                                widget.email ,
                                passwordController.text,
                                confirmPassController.text,
                              );

                              if (forgetPassProviderprovider.isSuccess) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => SignupScreen()),
                                );
                              } else if (forgetPassProviderprovider.errorMessage != null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  
                                  SnackBar(
                                      backgroundColor: Colors.redAccent,
                                    content: Text(forgetPassProviderprovider.errorMessage!)),
                                );
                              }
                            },
                          );
                  },
                ),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
