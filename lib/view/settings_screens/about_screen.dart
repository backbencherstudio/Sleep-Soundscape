import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sleep_soundscape/model_view/theme_provider.dart';
import 'package:sleep_soundscape/view/settings_screens/widgets/bottom_sheet_header.dart';
class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});
  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  final isSelected = false;
  @override
  Widget build(BuildContext context) {

    final darkTheme = context.watch<ThemeProvider>().isDarkMode;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
           darkTheme ? Positioned.fill(
              child: Image.asset(
                "assets/images/home_screen_img.png",
                fit: BoxFit.cover,
              ),
            ) : SizedBox(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, ),
              child: Column(
                children: [
                  BottomSheetHeader(imagePath:  "assets/icons/back.png",title:  "About",),
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
                              // color:  Color.fromRGBO(255, 255, 255, 0.60),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w300,
                            ),
                          ),    TextSpan(
                            text: "Bulid 3",
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              // color:  Color.fromRGBO(255, 255, 255, 0.60),
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
                    // color: Color.fromRGBO(255, 255, 255, 0.60),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w300
                  ),),
                  SizedBox(height: 18.h,),
                  Text("Made with Love from Bangladesh",style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      // color: Color.fromRGBO(255, 255, 255, 0.60),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w300
                  ),),
                  SizedBox(height: 5.h,),
                  Text("2025 Sleep Soundscape",style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      // color: Color.fromRGBO(255, 255, 255, 0.60),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w300
                  ),),
                  SizedBox(height: 24.h,),
                  Text("Developer Team: ",style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    // color: Color.fromRGBO(255, 255, 255, 0.60),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w300
                  ),),
                  SizedBox(height: 5.h,),
                  Text("Nahidul Islam Shakin \nHabibul Bashar \nAbdul Wahab \nSafrid Bhuiyan ",textAlign: TextAlign.center,style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    // color: Color.fromRGBO(255, 255, 255, 0.60),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w300
                  ),),
                 SizedBox(height: 120.h,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }



}