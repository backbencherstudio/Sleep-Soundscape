import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sleep_soundscape/model_view/reminder_screen_provider.dart';
import 'package:sleep_soundscape/view/reminder_screen/reminder_widgets/reminder_widgets.dart';

class SetTimer extends StatefulWidget{
  void Function(int) onSelectedHour;
  void Function(int) onSelectedMinute;
  void Function(int) onSelectedAmPm;
   SetTimer({super.key, required this.onSelectedHour, required this.onSelectedMinute, required this.onSelectedAmPm});

  @override
  State<SetTimer> createState() => _SetTimerState();
}

class _SetTimerState extends State<SetTimer> {


  List<int> hours = List.generate(12, (index) => index + 1); // 1-12
  List<int> minutes = List.generate(60, (index) => index); // 0-59
  List<String> amPm = ['AM', 'PM'];

  // int selectedHour = 0;
  // int selectedMinute = 0;
  // String selectedAmPm = 'AM';
  //
  // void setHour(int selectedH){
  //   selectedHour = selectedH;
  // }
  //
  // void setMinute(int selectedM){
  //   selectedMinute = selectedM;
  // }
  //
  // void setAmPm(int selectedAmPm){
  //   if(selectedAmPm == -1){
  //     this.selectedAmPm = 'AM';
  //   }
  //   else if(selectedAmPm == -2){
  //     this.selectedAmPm = 'PM';
  //   }
  //
  // }


  @override
  Widget build(BuildContext context) {
    return   Row(
      spacing: 5.w,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Consumer<ReminderScreenProvider>(
          builder: (_, reminderScreenProvider, child) {
            return ReminderWidgets().buildCupertinoPicker(
              context,
              hours,
              8,
              widget.onSelectedHour,
              false,
            );
          }
        ),
        Text(":"),
        ReminderWidgets().buildCupertinoPicker(
          context,
          minutes,
          22,
          widget.onSelectedMinute,
          false,
        ),

        ReminderWidgets().buildCupertinoPicker(
          context,
          amPm,
          'PM',
          widget.onSelectedAmPm,
          true,
        ),
      ],
    );
  }
}