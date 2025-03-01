import 'dart:async';
import 'dart:math';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:intl/intl.dart';
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
      autoStart: false,
      isForegroundMode: false,
    ),
  );

 // service.startService();
}

/// Runs when the alarm triggers
@pragma('vm:entry-point') // Required for AOT compilation
void onStart(ServiceInstance service) async {
  print("\nbackground service's onStart method started\n");
  final AudioPlayer _audioPlayer = AudioPlayer();

  // Listen for commands (only play audio when alarmCallback() invokes it)
  service.on("play_audio").listen((event) async {
    debugPrint("\nAlarm Triggered: Playing Sound!\n");


    String demoAudioPath = "musics/alarm-01.mp3";

    try {
      await _audioPlayer.setReleaseMode(ReleaseMode.loop);
      await _audioPlayer.play(AssetSource(demoAudioPath), volume: 1,);
    } catch (e) {
      print("\nError playing audio: $e/n");
    }
  });

  service.on("stop_audio").listen((event)  async {
    debugPrint("Stopping Alarm Sound...");
    try{

      await _audioPlayer.stop();
     // await _audioPlayer.dispose();
      debugPrint("\nSuccessfully alarm stopped.\n");
    }catch(error){
      debugPrint("\nError while stopping alarm audio : $error\n");
    }

  });

  if (service is AndroidServiceInstance) {
    service.setAsForegroundService();
  }
}

/// Alarm callback method, should be called when alarm triggered
@pragma('vm:entry-point') // Required for AOT compilation
void alarmCallback(int id,
    Map<String, dynamic> params
    ) async {
  FlutterBackgroundService service = FlutterBackgroundService();
  bool isRunning = await service.isRunning();

  final String title = params["title"];
  final String body = params["body"];
  final int alarmID = id;

  ///Canceling the alarm immediately after it fires
  await AndroidAlarmManager.cancel(alarmID);

  try{

    WidgetsFlutterBinding.ensureInitialized();
    debugPrint("\nAlarm triggered!\n");
      debugPrint("\nBackground Service Starting...\n");

    if(!isRunning){
      await service.startService();
    }


    service.invoke('play_audio');


    Timer(Duration(seconds: 30),(){
      service.invoke("stop_audio");
    });


  }catch(error){
    debugPrint("\nError while triggering alarm : $error\n");
  }

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

  List<bool> _repetitionDay = List<bool>.filled(7,false);
  List<bool> get repetitionDay => _repetitionDay;

  void onSelectRepeat(int index, bool value){
    if(value == true){
      debugPrint("\n$index number day will repeat.\n");
    }
    else{
      debugPrint("\n$index number day will not repeat.\n");
    }
    _repetitionDay[index] = value;

    if(index == 0){
      updateRepeatDays('Sunday', value);
    }
    else if (index == 1){
      updateRepeatDays('Monday', value);
    }
    else if (index == 2){
      updateRepeatDays('Tuesday', value);
    }
    else if (index == 3){
      updateRepeatDays('Wednesday', value);
    }
    else if (index == 4){
      updateRepeatDays('Thursday', value);
    }
    else if (index == 5){
      updateRepeatDays('Friday', value);
    }
    else if (index == 6){
      updateRepeatDays('Saturday', value);
    }

    notifyListeners();
  }

  List<String> _selectedRepeatDays = [];

  void updateRepeatDays (String day, bool isSelected){
    if(isSelected){
      if(!_selectedRepeatDays.contains(day)){
        _selectedRepeatDays.add(day);
        notifyListeners();
      }
    }
    else{
      _selectedRepeatDays.remove(day);
      notifyListeners();
    }
    debugPrint("\nDays to repeate : $_selectedRepeatDays\n");
  }


  ///Set alarm hour
  void setHour(int selectedH){
    _selectedHour = selectedH;
    debugPrint("\nSelected hour : $selectedH\n");
    notifyListeners();
  }

  ///Set alarm minute
  void setMinute(int selectedM){
    _selectedMinute = selectedM;
    debugPrint("\nSelected minute : $selectedM\n");
    notifyListeners();
  }

  ///Set alarm am/pm
  void setAmPm(int selectedAmPm){
    if(selectedAmPm == -1){
      _selectedAmPm = 'AM';
    }
    else if(selectedAmPm == -2){
      _selectedAmPm = 'PM';
    }
    debugPrint("\nSelected am / pm : $selectedAmPm\n");
    notifyListeners();
  }


  void addReminder(DateTime time) async {
    debugPrint("\nAdding this time to reminder : ${DateFormat('hh:mma').format(time).toLowerCase()}\n");
    _reminders!.reminderList!.add(
      ReminderList(
        amPm: _selectedAmPm,
        days: "WTF",
        time: DateFormat('hh:mma').format(time).toLowerCase(),
        title: "Sleep Reminder"
      )
    );
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

     ///set the exact alarm time
      _selectedTime = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, _selectedHour, _selectedMinute,);
      debugPrint("\n selected time : $_selectedTime\n");

      addReminder(_selectedTime);
      ///difference between now and alarm time
      Duration difference = (_selectedTime.subtract(Duration(minutes: 5),)).difference(now);

      ///Initialize time zone for showing alarm notification using local time zone
      initializeTimeZones();

      ///Initialize notification
      final notificationService = NotificationServices();
      notificationService.initialize();

      ///Scheduling alarm notification based on difference of now and alarm time
      /// If alarm is gonna happen in 5 minutes set the notification time after 1 second of adding alarm
      /// else set it before 5 minutes of alarm trigger
      if(difference.isNegative || difference.inMinutes == 0){
        NotificationServices.scheduledNotification("Sleep Soundscape", "Alarm is going to ring", Duration(seconds: 1) );
      }
      else{
        NotificationServices.scheduledNotification("Sleep Soundscape", "Alarm is going to ring", difference );
      }

      final dynamic alarmId = DateTime.now().millisecondsSinceEpoch.remainder(100000);

      ///Alarm scheduling
      bool scheduled = await AndroidAlarmManager.oneShotAt(

        ///This is alarm time (When alarm should triggered)
        _selectedTime,

        ///This is alarm id (alarm id should be unique for each alarm)
        alarmId,

        ///This is background service, when alarm time comes, this method will trigger
        alarmCallback,

        ///Turn on alarm clock
        alarmClock: true,

        ///Ring alarm when phone is in idle
        allowWhileIdle: true,

        ///Re-schedule alarm after the mobile re-boot or re-start, if it false, the alarm will not re-scheduled after
        ///re-boot or power off - on
        rescheduleOnReboot: true,

        ///This parameter will pass to alarmCallBack
        params: {
        "title": "Alarm Title",
          "body" : "Alarm Body",
          "alarmId": alarmId
        },

        ///If true, the alarm will trigger at the exact specified time.
        /// If false, the system may delay the alarm slightly to optimize battery performance.
        exact: true,

        ///If true, the alarm wakes up the device if it’s sleeping.
        /// If false, the alarm only triggers when the device is already awake.
        wakeup: true,
      );

      debugPrint("\nAlarm Scheduled : $scheduled\n");

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
  DateTime _selectedTime = DateTime.now().add(Duration(seconds: 5));
  DateTime get selectedTime => _selectedTime;


  
}