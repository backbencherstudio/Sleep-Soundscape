import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sleep_soundscape/Utils/route_name.dart';
import 'package:sleep_soundscape/model/goal.dart';
import 'package:sleep_soundscape/view/Login_Screen/widget/myButton.dart';

// ignore: must_be_immutable
class GoalScreen extends StatelessWidget {
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

  GoalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        title: RichText(
          text: TextSpan(
            text: "Select your ",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: Color(0xFFFFFFFF),
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
                  color: Color.fromRGBO(255,255,255,0.6)
              ),)
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16.r),
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
                          color: Colors.grey.shade700.withOpacity(0.2),
                        ),
                        child: Center(
                          child: ListTile(
                            title: Text(
                              goals[index].title,
                              style: Theme.of(
                                context,
                              ).textTheme.bodySmall!.copyWith(
                                color: Color(0xFFFFFFFFF),
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp,
                              ),
                            ),
                            subtitle: Text(
                              goals[index].description,
                              style: Theme.of(
                                context,
                              ).textTheme.bodySmall!.copyWith(
                                color: Color(0xFFFFFFFFF),
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
            Mybutton(
              text: "Continue",
              color: Color(0xFFFAD051),
              ontap: () {
                Navigator.pushNamedAndRemoveUntil(context, RouteName.homeScreen, (_)=>false);
              },
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}
