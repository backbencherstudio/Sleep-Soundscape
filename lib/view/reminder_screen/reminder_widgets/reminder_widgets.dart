import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sleep_soundscape/view/reminder_screen/setup_reminder_screen.dart';

import '../../../model_view/reminder_screen_provider.dart';
import '../add_reminder_screen.dart';
import '../reminder_screen.dart';

class ReminderWidgets{

  Widget buildCupertinoPicker(BuildContext context,
      List<dynamic> items, dynamic selectedValue, Function(dynamic) onSelectedItemChanged, bool isAmPm
      ) {
  //  List<dynamic>
   // items = [01,02,03,04,05,06,07,08,09,10,11,12];
    return SizedBox(
      width: 70.w,
      height: 139.h,
      child: CupertinoPicker(
        backgroundColor: Colors.transparent,
        scrollController: FixedExtentScrollController(
          initialItem: items.indexOf(selectedValue),
        ),
        itemExtent: 40,
        looping: isAmPm ? false : true,
        onSelectedItemChanged: (index) {
          onSelectedItemChanged(items[index]);
        },
        squeeze: 01,
      diameterRatio: 2,
        children: items.map((item) {
          return Center(
            child: Text(

            item.toString(),
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: isAmPm ? 16.sp : 24.sp,
                fontWeight: FontWeight.w400
              ),
            ),
          );
        }).toList(),
      ),
    );
  }



  static Future<dynamic> reminderBottomSheet({required BuildContext context,
  required Widget widgetToShowInBottomSheet
  }){
    return showModalBottomSheet(
        backgroundColor: Color(0xFF0F0F13),
        isScrollControlled: true,
        useSafeArea: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(26.r)),
        ),
        context: context,
        builder: (context){
          return  widgetToShowInBottomSheet;
          //   Consumer<ReminderScreenProvider>(
          //     builder: (_, reminderScreenProvider, child) {
          //       if(reminderScreenProvider.pageId==1){
          //         return  ReminderScreen();
          //       }
          //       else if(reminderScreenProvider.pageId==2){
          //         return  AddReminderScreen();
          //       }
          //       else if(reminderScreenProvider.pageId==3){
          //         return SetupReminderScrfeen();
          //       }
          //       return SizedBox();
          //
          //     }
          // );
          //   Padding(
          //   padding:  EdgeInsets.only(left: 24.w,right: 24.w,bottom: 58.h),
          //   child: Column(
          //     children: [
          //       Container(
          //         margin: EdgeInsets.all(6.r),
          //         width: 115.w,
          //         height: 6.h,
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(100),
          //           color: Colors.white.withOpacity(0.1),
          //         ),
          //       ),
          //       SizedBox(height: 12.h,),
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           GestureDetector(
          //             onTap:()=> Navigator.pop(context),
          //             child: Container(
          //               width: 32.w,
          //               height: 32.h,
          //               padding: EdgeInsets.all(7.r),
          //               decoration: BoxDecoration(
          //                 border: Border.all(color: Colors.white.withOpacity(0.08),),
          //                 shape: BoxShape.circle,
          //
          //               ),
          //               child: Icon(Icons.arrow_back_ios_new,color: Colors.white,size: 18.r,),
          //             ),
          //           ),
          //           Text("Reminder",
          //           style:Theme.of(context).textTheme.headlineSmall?.copyWith(
          //             color: Colors.white,fontWeight: FontWeight.w600
          //           ),),
          //           TextButton(
          //             style: TextButton.styleFrom(
          //               padding: EdgeInsets.all(0),
          //
          //             ),
          //             onPressed: (){}, child: Text("Add",style: Theme.of(context).textTheme.bodyMedium,),)
          //         ],
          //       ),
          //       SizedBox(height: 25.h,),
          //       Expanded(
          //         child: Consumer<ReminderScreenProvider>(
          //           builder: (_, reminderScreenProvider, child) {
          //             return ListView.builder(
          //               itemCount: reminderScreenProvider.reminders!.reminderList!.length,
          //              // physics: NeverScrollableScrollPhysics(),
          //              // shrinkWrap: true,
          //               itemBuilder: (_, index){
          //                 final reminder_screen = reminderScreenProvider.reminders!.reminderList![index];
          //                 return Container(
          //                   width: 345.w,
          //                   margin: EdgeInsets.only(bottom: 12.h),
          //                   padding: EdgeInsets.all(12.r),
          //                   decoration: BoxDecoration(
          //                     color: Colors.white.withOpacity(0.04),
          //                     borderRadius: BorderRadius.circular(14.r)
          //
          //                   ),
          //                   child: Row(
          //                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                     crossAxisAlignment: CrossAxisAlignment.end,
          //                     children: [
          //                       Expanded(
          //                         child: Column(
          //                           crossAxisAlignment: CrossAxisAlignment.start,
          //                           spacing: 8.h,
          //                           children: [
          //                             Text(reminder_screen.title!,
          //                             style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          //                               fontWeight: FontWeight.w300
          //                             ),),
          //                             RichText(
          //                               text: TextSpan(
          //                                 text: reminder_screen.time,
          //                                 style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          //                                   fontSize: 24.sp,
          //                                   fontWeight: FontWeight.w500,
          //                                 ),
          //                                 children: [
          //                                   TextSpan(
          //                                     text: reminder_screen.amPm
          //                                   )
          //                                 ]
          //                               ),
          //                             ),
          //                             Text(reminder_screen.days!,
          //                             style: Theme.of(context).textTheme.bodySmall?.copyWith(
          //                               fontSize: 12.sp,
          //                               fontWeight: FontWeight.w300
          //                             ),)
          //                           ],
          //                         ),
          //                       ),
          //                       Align(
          //                         alignment: Alignment.bottomRight,
          //                         child:
          //                       //  TextButton(
          //                        //   style:TextButton.styleFrom(
          //                        //     padding: EdgeInsets.all(0),m
          //                         ////  ),
          //                           //onPressed: (){},
          //                         //  child:
          //                           GestureDetector(
          //                             onTap:(){},
          //                             child: Text("Setup",
          //                             style: Theme.of(context).textTheme.bodyMedium,),
          //                           ),
          //                        // ),
          //                       )
          //                     ],
          //                   ),
          //                 );
          //               },
          //             );
          //           }
          //         ),
          //       )
          //     ],
          //   ),
          // );
        });
  }

}