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

  int _selectedHour = 0;
  int _selectedMinute = 0;
  String _selectedAmPm = 'AM';

  String _selectedDay = "Saturday";


  void setHour(int selectedH){
    _selectedHour = selectedH;
  }

  void setMinute(int selectedM){
    _selectedMinute = selectedM;
  }

  void setAmPm(int selectedAmPm){
    if(selectedAmPm == -1){
      _selectedAmPm = 'AM';
    }
    else if(selectedAmPm == -2){
      _selectedAmPm = 'PM';
    }

  }


  ///convert user inputted time to DateTime object
  void onSave(){
    _selectedHour = ((_selectedAmPm == "PM") && (_selectedHour!=12)) ? _selectedHour + 12 : _selectedHour;
    DateTime now = DateTime.now();
    int day;
    if(_selectedDay == 'Sunday'){
      day = DateTime.sunday;
    }
    else if(_selectedDay == "Monday"){
      day = DateTime.monday;
    }
    else if(_selectedDay == "Tuesday"){
      day = DateTime.tuesday;
    }
    else if(_selectedDay == "Wednesday"){
      day = DateTime.wednesday;
    }
    else if(_selectedDay == "Thursday"){
      day = DateTime.thursday;
    }
    else if(_selectedDay == "Friday"){
      day = DateTime.friday;
    }
    else if(_selectedDay == "Saturday"){
      day = DateTime.saturday;
    }
    else{
      day = now.day;
    }

    _selectedTime =  DateTime(now.year, now.month, day, _selectedHour, _selectedMinute,);
    debugPrint("\n selected time : $_selectedTime\n");
    notifyListeners();
  }

  ///Setting Alarm/Reminder
  DateTime? _selectedTime;
  DateTime? get selectedTime => _selectedTime;

  Future<void> addReminder({required DateTime time}) async {

    notifyListeners();
  }
  
}