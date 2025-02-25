import 'package:flutter/cupertino.dart';

class NotificationProvider with ChangeNotifier{
  bool _isNotificationOn = false ;
  bool _isRingOnSilent = false;
  bool _isPopupAlertOn = false;

  bool get isNotificationOn => _isNotificationOn ;
  bool get isRingOnSilent => _isRingOnSilent;
  bool get isPopupAlertOn => _isPopupAlertOn;

  void toggleNotificationSwitch(){
    _isNotificationOn = !_isNotificationOn;
    notifyListeners();
  }

  void toggleRingOnSilentSwitch(){
    _isRingOnSilent = !_isRingOnSilent;
    notifyListeners();
  }

  void togglePopupAlertSwitch(){
    _isPopupAlertOn = !_isPopupAlertOn;
    notifyListeners();
  }
}