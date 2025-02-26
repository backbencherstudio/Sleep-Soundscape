import 'package:flutter/material.dart';
import 'package:sleep_soundscape/model/reminder.dart';

class ReminderScreenProvider with ChangeNotifier{

  ReminderScreenProvider(){
    getReminders();
  }


  final Map<String, dynamic> jsonReminders = {
    "reminderList" : [
      {
        "title": "Sleep Reminder",
        "time": "10:00",
        "amPm": "pm",
        "days": "SMT"
      },
      {
        "title": "Wakeup Reminder",
        "time": "06:00",
        "amPm": "am",
        "days": "Everyday"
      },
      {
        "title": "Play Reminder",
        "time": "04:00",
        "amPm": "pm",
        "days": "WTF"
      },
      {
        "title": "Library Reminder",
        "time": "07:00",
        "amPm": "pm",
        "days": "WTF"
      }
    ]

  };
  
  ReminderModel? _reminders;
  ReminderModel? get reminders => _reminders;


  ReminderList? _reminderToSetup;
  ReminderList? get reminderToSetup => _reminderToSetup;

  void onSetup(int index){
    _reminderToSetup = _reminders!.reminderList![index];
    notifyListeners();
  }

  
  void getReminders(){
    _reminders = ReminderModel.fromJson(jsonReminders);
    notifyListeners();
  }


  ///Setting Alarm/Reminder
  DateTime? _selectedTime;
  DateTime? get selectedTime => _selectedTime;

  Future<void> addReminder({required DateTime time}) async {

    notifyListeners();
  }
  
}