import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sleep_soundscape/Utils/route_name.dart';
import 'package:sleep_soundscape/global_widget/custom_button.dart';
import 'package:sleep_soundscape/model/goal.dart';
import 'package:sleep_soundscape/model_view/theme_provider.dart';
import 'package:sleep_soundscape/view/Login_Screen/widget/myButton.dart';

// ignore: must_be_immutable
class PersonalizationScreen extends StatelessWidget {
  List<Goal> goals = [
    Goal(
      title: "Deep Sleep",
      description: "Get a quality Sleep",
      img: "assets/icons/1.5.png",
    ),
    Goal(
      title: "Overcome Stress",
      description: "Manage stress & Anxiety",
      img: "assets/icons/1.4.png",
    ),
    Goal(
      title: "Feel Nature",
      description: "Hear diverse nature sounds",
      img: "assets/icons/1.3.png",
    ),
    Goal(
      title: "Improve Performance",
      description: "Get a better start",
      img: "assets/icons/1.2.png",
    ),
    Goal(
      title: "Boost Concentration",
      description: "Improve focus",
      img: "assets/icons/1.1.png",
    ),
  ];

  PersonalizationScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final darkTheme = context.watch<ThemeProvider>().isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            text: "Select your ",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              // color: Color(0xFFFFFFFF),
            ),

            children: <TextSpan>[
              TextSpan(
                text: "Goal",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFFAD051),
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        actionsPadding: EdgeInsets.only(right: 24.w),
        actions: [
          TextButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: Text("skip",style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w300,
                  fontFamily: "lexend",
                  // color: Color.fromRGBO(255,255,255,0.6)
              ),)
          )
        ],
        surfaceTintColor: Colors.transparent,
      ),

      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SizedBox(height: 8.h,),
            Expanded(
              child: ListView.builder(
                itemCount: goals.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        height: 96.h,
                        padding: EdgeInsets.symmetric(horizontal: 8,),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22.r),
                          border: Border.all(color: Color(0xFF4B5155)),
                          color: Color.fromRGBO(0, 0, 0, 0.04),
                        ),
                        child: Center(
                          child: ListTile(
                            title: Text(
                              goals[index].title,
                              style: Theme.of(
                                context,
                              ).textTheme.bodySmall!.copyWith(

                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp,
                              ),
                            ),
                            subtitle: Text(
                              goals[index].description,
                              style: Theme.of(
                                context,
                              ).textTheme.bodySmall!.copyWith(

                                fontWeight: FontWeight.w300,
                                fontSize: 14.sp,
                              ),
                            ),

                            trailing: Padding(
                              padding: EdgeInsets.only(
                                left: 25.w,
                              ), // Add custom spacing here
                              child: Image.asset(
                                goals[index].img,
                                height: 49.h,
                                width: 48.w,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 6.h),
            CustomButton(
              text: "Continue",
              onPressed: () {
                Navigator.pop(context);
                // Navigator.pushNamedAndRemoveUntil(context, RouteName.profileScreen, (_)=>false);
              },

            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}
