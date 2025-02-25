import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../model_view/reminder_screen_provider.dart';

class ReminderScreen extends StatelessWidget {
  const ReminderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return
      // Scaffold(
      // body:
      Padding(
        padding:  EdgeInsets.only(left: 24.w,right: 24.w,bottom: 58.h),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(6.r),
              width: 115.w,
              height: 6.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.white.withOpacity(0.1),
              ),
            ),
            SizedBox(height: 12.h,),

            ///Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap:()=> Navigator.pop(context),
                  child: Container(
                    width: 32.w,
                    height: 32.h,
                    padding: EdgeInsets.all(7.r),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white.withOpacity(0.08),),
                      shape: BoxShape.circle,

                    ),
                    child: Icon(Icons.arrow_back_ios_new,color: Colors.white,size: 18.r,),
                  ),
                ),
                Text("Reminder",
                  style:Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.white,fontWeight: FontWeight.w600
                  ),),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.all(0),

                  ),
                  onPressed: (){
                    context.read<ReminderScreenProvider>().setPageID(2);
                  }, child: Text("Add",style: Theme.of(context).textTheme.bodyMedium,),)
              ],
            ),

            SizedBox(height: 25.h,),

            ///List of reminder
            Expanded(
              child: Consumer<ReminderScreenProvider>(
                  builder: (_, reminderScreenProvider, child) {
                    return ListView.builder(
                      itemCount: reminderScreenProvider.reminders!.reminderList!.length,
                      // physics: NeverScrollableScrollPhysics(),
                      // shrinkWrap: true,
                      itemBuilder: (_, index){
                        final reminder = reminderScreenProvider.reminders!.reminderList![index];
                        return Container(
                          width: 345.w,
                          margin: EdgeInsets.only(bottom: 12.h),
                          padding: EdgeInsets.all(12.r),
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.04),
                              borderRadius: BorderRadius.circular(14.r)

                          ),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  spacing: 8.h,
                                  children: [
                                    Text(reminder.title!,
                                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                          fontWeight: FontWeight.w300
                                      ),),
                                    RichText(
                                      text: TextSpan(
                                          text: reminder.time,
                                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                            fontSize: 24.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          children: [
                                            TextSpan(
                                                text: reminder.amPm
                                            )
                                          ]
                                      ),
                                    ),
                                    Text(reminder.days!,
                                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w300
                                      ),)
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child:
                                //  TextButton(
                                //   style:TextButton.styleFrom(
                                //     padding: EdgeInsets.all(0),m
                                ////  ),
                                //onPressed: (){},
                                //  child:
                                GestureDetector(
                                  onTap:(){
                                    context.read<ReminderScreenProvider>().onSetup(index);
                                    context.read<ReminderScreenProvider>().setPageID(3);
                                  },
                                  child: Text("Setup",
                                    style: Theme.of(context).textTheme.bodyMedium,),
                                ),
                                // ),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  }
              ),
            )
          ],
        ),
      );
    // );
  }
}