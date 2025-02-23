import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../model_view/reminder_screen_provider.dart';

class ReminderScreen {

  Future<dynamic> reminderBottomSheet(BuildContext context){
    return showModalBottomSheet(
        backgroundColor: Color(0xFF0F0F13),
        isScrollControlled: true,
        useSafeArea: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(26.r)),
        ),
        context: context,
        builder: (context){
          return Padding(
            padding:  EdgeInsets.only(left: 24.w,right: 24.w,bottom: 58.h),
            child: SingleChildScrollView(
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
                        onPressed: (){}, child: Text("Add",style: Theme.of(context).textTheme.bodyMedium,),)
                    ],
                  ),
                  SizedBox(height: 32.h,),
                  Consumer<ReminderScreenProvider>(
                    builder: (_, reminderScreenProvider, child) {
                      return ListView.builder(
                        itemCount: reminderScreenProvider.reminders!.reminderList!.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (_, index){
                          final reminder = reminderScreenProvider.reminders!.reminderList![index];
                          return Container(
                            width: 345.w,
                            margin: EdgeInsets.only(bottom: 12.h),
                            padding: EdgeInsets.all(12.r),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.4),

                            ),
                            child: Column(
                              spacing: 8.h,
                              children: [
                                Text(reminder.title!),
                                RichText(
                                  text: TextSpan(
                                    text: reminder.time,
                                    style: Theme.of(context).textTheme.bodyLarge,
                                    children: [
                                      TextSpan(
                                        text: reminder.amPm
                                      )
                                    ]
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      );
                    }
                  )
                ],
              ),
            ),
          );
        });
  }

}