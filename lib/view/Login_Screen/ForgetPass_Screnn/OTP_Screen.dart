import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sleep_soundscape/view/Login_Screen/login_Screen.dart';
import 'package:sleep_soundscape/view/Login_Screen/widget/myButton.dart';

// ignore: must_be_immutable
class Otpscreen extends StatelessWidget {
   Otpscreen({super.key});

  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: ()=> Navigator.pop(context),
            icon : Icon(Icons.arrow_back_ios),),
        centerTitle: true,
        title: Text("Enter OPT"),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 32.h,
              ),
              Text(
                "Enter the One-Time OTP sent to your to confirm your identity",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.black54),
              ),
              SizedBox(
                height: 24.h,
              ),
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
                    inactiveColor: Color(0xFFFAD051)
                    
                    ),
                appContext: context,
                animationDuration: Duration(milliseconds: 200),
                backgroundColor: Colors.transparent,
                enableActiveFill: true,
                onCompleted: (v) {
                  print("Completed");
                },
                onChanged: (value) {},
                beforeTextPaste: (text) {
                  print("Allowing to paste $text");

                  return true;
                },
              ),
            
            
              SizedBox(
                height: 32.h,
              ),
             Mybutton(text: "Confirm", color: Color(0xFFFAD051), ontap: (){
              //povider-----logic then redirect to reset password screen
              Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
           
             })
            ],
          ),
        ),
      ),
    );
  }
}