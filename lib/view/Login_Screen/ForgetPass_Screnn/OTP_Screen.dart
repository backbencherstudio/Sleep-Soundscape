import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:sleep_soundscape/model_view/ForgetPass_provider.dart';
import 'package:sleep_soundscape/view/Login_Screen/ForgetPass_Screnn/ResetPass_Screen.dart';
import 'package:sleep_soundscape/view/Login_Screen/widget/myButton.dart';

// ignore: must_be_immutable
class Otpscreen extends StatelessWidget {
  final String email; 
  Otpscreen({super.key, required this.email});

  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios),
        ),
        centerTitle: true,
        title: Text("Enter OTP"),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 32.h),
              Text(
                "Enter the One-Time OTP sent to your email to confirm your identity",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.black54),
              ),
              SizedBox(height: 24.h),
              PinCodeTextField(
                length: 6,
                obscureText: false,
                controller: otpController,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(4.r),
                  fieldHeight: 50.h,
                  fieldWidth: 45.w,
                  activeFillColor: Colors.white,
                  selectedFillColor: Colors.white,
                  selectedColor: Colors.red,
                  inactiveFillColor: Colors.white,
                  inactiveColor: Color(0xFFFAD051),
                ),
                appContext: context,
                animationDuration: Duration(milliseconds: 200),
                backgroundColor: Colors.transparent,
                enableActiveFill: true,
                onChanged: (value) {},
              ),
              SizedBox(height: 32.h),

Consumer<ForgetPassProvider>(
  builder: (context, provider, child) {
    return provider.isLoading
        ? Center(child: CircularProgressIndicator())
        : Mybutton(
            text: "Confirm",
            color: otpController.text.length == 6
                ? Color(0xFFFAD051)
                : Colors.grey, // Button color change based on OTP length
            ontap: otpController.text.length == 6
                ? () {
                    provider.verifyOtp(email, otpController.text.trim());

              
                    
                     () {
                      if (provider.isSuccess) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResetpassScreen(
                              email: email,
                              otp: otpController.text,

                            ),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              backgroundColor: Colors.redAccent,
                            content: 
                            Text(provider.errorMessage ??
                                "Failed to verify OTP"),
                          ),
                        );
                      }
                    };
                  }
                : null, // Disable button if OTP not entered
          );
  },
)







            ],
          ),
        ),
      ),
    );
  }
}
