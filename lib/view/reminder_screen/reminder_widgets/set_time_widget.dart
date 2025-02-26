import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sleep_soundscape/view/reminder_screen/reminder_widgets/reminder_widgets.dart';

class SetTimer extends StatefulWidget{
  const SetTimer({super.key});

  @override
  State<SetTimer> createState() => _SetTimerState();
}

class _SetTimerState extends State<SetTimer> {


  List<int> hours = List.generate(12, (index) => index + 1); // 1-12
  List<int> minutes = List.generate(60, (index) => index); // 0-59
  List<String> amPm = ['AM', 'PM'];


  @override
  Widget build(BuildContext context) {
    return   Row(
      spacing: 5.w,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ReminderWidgets().buildCupertinoPicker(
          context,
          hours,
          8,
              (value) {
            debugPrint("\nValue : $value\n");
          },
          false,
        ),
        Text(":"),
        ReminderWidgets().buildCupertinoPicker(
          context,
          minutes,
          22,
              (value) {
            debugPrint("\nValue : $value\n");
          },
          false,
        ),

        ReminderWidgets().buildCupertinoPicker(
          context,
          amPm,
          'PM',
              (value) {
            debugPrint("\nValue : $value\n");
          },
          true,
        ),
      ],
    );
  }
}