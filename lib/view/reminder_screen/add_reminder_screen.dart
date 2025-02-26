import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sleep_soundscape/model_view/reminder_screen_provider.dart';
import 'package:sleep_soundscape/view/reminder_screen/reminder_widgets/add_reminder_header.dart';
import 'package:sleep_soundscape/view/reminder_screen/reminder_widgets/dropdown_widget.dart';
import 'package:sleep_soundscape/view/reminder_screen/reminder_widgets/reminder_widgets.dart';
import 'package:sleep_soundscape/view/reminder_screen/reminder_widgets/set_time_widget.dart';

class AddReminderScreen extends StatelessWidget {
  const AddReminderScreen({super.key});

  dynamic nothing(dynamic id) {
    debugPrint("\nNumber : $id\n");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 785.h,
      padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 58.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.all(6.r),
                width: 115.w,
                height: 6.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white.withOpacity(0.1),
                ),
              ),
            ),
            SizedBox(height: 12.h),
        
            ///Header
            AddReminderHeader(headerText: "Add Reminder",onSave:  () => Navigator.pop(context),),
            SizedBox(height: 25.h),
            Text("Reminder Time"),
            SizedBox(height: 24.h),
        
            ///Set timer widget
            SetTimer(),

            SizedBox(height: 32.h,),
            Text("Advanced"),
            SizedBox(height: 24.h,),
        
            ReminderDropDownButton(hintText: "Select Reminder Type", uniqueItemList: ['Focus', 'Sleep', 'Breath', 'Meditation', 'Nap', 'General'],),

            SizedBox(height: 12.h,),

            ReminderDropDownButton(hintText : "Select repeat",uniqueItemList: ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'],),

            SizedBox(height: 50.h,),
          ],
        ),
      ),
    );
  }
}
