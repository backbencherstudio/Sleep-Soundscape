import 'dart:async';
import 'dart:math';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:sleep_soundscape/model/reminder.dart';
import 'package:timezone/data/latest.dart';

import '../notification_services/notification_services.dart';

/// Initialize background service
Future<void> initializeService() async {
  final service = FlutterBackgroundService();

  await service.configure(
    iosConfiguration: IosConfiguration(
      onForeground: onStart,
    ),
    androidConfiguration: AndroidConfiguration(
      onStart: onStart,
      autoStart: true,
      isForegroundMode: true,
    ),
  );

  service.startService();
}

/// Runs when the alarm triggers
@pragma('vm:entry-point') // Required for AOT compilation
void onStart(ServiceInstance service) async {
  print("Alarm Triggered & Playing Sound!");
  final AudioPlayer _audioPlayer = AudioPlayer();

  // Listen for commands (only play audio when alarmCallback() invokes it)
  service.on("play_audio").listen((event) async {
    print("Alarm Triggered: Playing Sound!");


    String demoAudioPath = "musics/waves-02.mp3";

    try {
      await _audioPlayer.play(AssetSource(demoAudioPath), volume: 1);
    } catch (e) {
      print("\nError playing audio: $e/n");
    }
  });

  service.on("stop_audio").listen((event)  async {
    debugPrint("Stopping Alarm Sound...");
    try{

      await _audioPlayer.stop();
      await _audioPlayer.dispose();
      debugPrint("\nSuccessfully alarm stopped.\n");
    }catch(error){
      debugPrint("\nError while stopping alarm audio : $error\n");
    }

  });

  if (service is AndroidServiceInstance) {
    service.setAsForegroundService();
  }
}

// Example alarm callback function
@pragma('vm:entry-point') // Required for AOT compilation
void alarmCallback()  {
  WidgetsFlutterBinding.ensureInitialized();
  debugPrint("\nAlarm triggered!\n");

  FlutterBackgroundService service = FlutterBackgroundService();
  service.invoke('play_audio');

  Timer(Duration(seconds: 30),(){
    service.invoke("stop_audio");
  });


  // final AudioPlayer _audioPlayer = AudioPlayer();
  // String demoAudioPath = "musics/waves-02.mp3";
  //
  // try {
  //    _audioPlayer.play(AssetSource(demoAudioPath), volume: 1,);
  //    final notificationService = NotificationServices();
  //    initializeTimeZones();
  //     notificationService.initialize();
  //
  //    NotificationServices.scheduledNotification("Manual Alarm triggered", "This is alarm body");
  //   //  Future.delayed(Duration(seconds: 10));
  //     //_audioPlayer.stop();
  // } catch (e) {
  //   print("\nError playing audio: $e/n");
  // }
  //FlutterBackgroundService().invoke("play_audio");
}


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
    notifyListeners();
  }

  void setMinute(int selectedM){
    _selectedMinute = selectedM;
    notifyListeners();
  }

  void setAmPm(int selectedAmPm){
    if(selectedAmPm == -1){
      _selectedAmPm = 'AM';
    }
    else if(selectedAmPm == -2){
      _selectedAmPm = 'PM';
    }
    notifyListeners();
  }


  ///convert user inputted time to DateTime object
  Future<void> onSave() async {

    try{

      debugPrint("\n_Selected hour : $_selectedHour, minute : $_selectedMinute\n");

      _selectedHour = ((_selectedAmPm == "PM") && (_selectedHour != 12))
          ? _selectedHour + 12
          : (_selectedAmPm == "AM" && _selectedHour == 12)
          ? 0
          : _selectedHour; // Handle midnight (12 AM → 00:00)

      DateTime now = DateTime.now();


      DateTime nextDay = _getNextOccurrence(_selectedDay, _selectedHour, _selectedMinute);


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

     // _selectedTime = nextDay;
      _selectedTime = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 12, 32,);
      debugPrint("\n selected time : $_selectedTime\n");
      notifyListeners();

      DateTime _time = DateTime.now().add(Duration(seconds: 5));
      //DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, DateTime.now().hour, DateTime.now().minute+1);
      debugPrint("\nalarm time : $_selectedTime\n");

      bool scheduled = await AndroidAlarmManager.oneShotAt(_selectedTime ?? _time, Random().nextInt(1095),
        alarmCallback,
        alarmClock: true,
        allowWhileIdle: true,
        rescheduleOnReboot: true,
        params: {
        "param1": "Hello",
          'param2' : "World"
        },
        exact: true,
        wakeup: true,);

      debugPrint("Alarm Scheduled: $scheduled");

    }catch(error){
      debugPrint("\nerror while saving alarm : $error\n");
    }

  }


  /// Get next occurrence of a given day with time
  DateTime _getNextOccurrence(String dayName, int hour, int minute) {
    DateTime now = DateTime.now();
    int todayWeekday = now.weekday; // Monday = 1, Sunday = 7
    int targetWeekday = _getWeekdayFromName(dayName);

    // Calculate days until the next occurrence
    int daysUntilNext = (targetWeekday - todayWeekday) % 7;
    if (daysUntilNext <= 0) {
      daysUntilNext += 7; // Move to the next week if it's today or past
    }

    DateTime targetDate = now.add(Duration(days: daysUntilNext));
    return DateTime(targetDate.year, targetDate.month, targetDate.day, hour, minute);
  }
  /// Convert day name to weekday number
  int _getWeekdayFromName(String dayName) {
    const Map<String, int> weekdays = {
      "sunday": DateTime.sunday,
      "monday": DateTime.monday,
      "tuesday": DateTime.tuesday,
      "wednesday": DateTime.wednesday,
      "thursday": DateTime.thursday,
      "friday": DateTime.friday,
      "saturday": DateTime.saturday,
    };

    return weekdays[dayName.toLowerCase()] ?? DateTime.monday;
  }


  ///Setting Alarm/Reminder
  DateTime? _selectedTime;
  DateTime? get selectedTime => _selectedTime;

  Future<void> addReminder({required DateTime time}) async {

    notifyListeners();
  }
  
}