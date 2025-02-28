import 'package:flutter/material.dart';  // Better than just flutter/widgets.dart
import 'dart:ui' show Locale;  // More specific than intl/locale.dart
import 'package:sleep_soundscape/l10n/l10n.dart';

class LocalProvider with ChangeNotifier {
  Locale? _locale;
  
  Locale? get locale => _locale;

  void setLocale(Locale locale) {
    if (!L10n.all.contains(locale)) return;
    
    _locale = locale;
    notifyListeners();
  }

  
  void clearLocale() {
    _locale = null;
    notifyListeners();
  }
}