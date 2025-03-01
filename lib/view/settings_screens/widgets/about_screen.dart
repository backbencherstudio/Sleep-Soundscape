import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});
  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  final isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/home_screen_img.png",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
            child: Column(
              children: [
                // User Info
                Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Colors.grey, width: 1),
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(7.r),
                          child: Icon(Icons.arrow_back_ios, color: Colors.white, size: 10.sp),
                        ),
                      ),
                    ),
                    SizedBox(width: 120.w,),
                    Text("About",style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp
                    ),)
                  ],
                ),
                SizedBox(height: 110.h),
                // Wake-up Time Text
                Align(
                  alignment: Alignment.center,
                  child: RichText(
                    textAlign: TextAlign.center, // Centers the text horizontally
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Sleep \n",
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.white,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: "Soundscape \n",
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: const Color(0xffFAD051),
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),    TextSpan(
                          text: "Version 1.0.0 \n",
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color:  Color.fromRGBO(255, 255, 255, 0.60),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w300,
                          ),
                        ),    TextSpan(
                          text: "Bulid 3",
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color:  Color.fromRGBO(255, 255, 255, 0.60),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),



                const Spacer(),
                Text("www.backbencher.studio",style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Color.fromRGBO(255, 255, 255, 0.60),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w300
                ),),
                SizedBox(height: 18.h,),
                Text("Made with Love from Bangladesh",style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Color.fromRGBO(255, 255, 255, 0.60),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w300
                ),),
                SizedBox(height: 5.h,),
                Text("2025 Sleep Soundscape",style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Color.fromRGBO(255, 255, 255, 0.60),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w300
                ),)
              ],
            ),
          ),
        ],
      ),
    );
  }



}