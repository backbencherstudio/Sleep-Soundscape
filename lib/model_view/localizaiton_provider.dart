import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

// class LocalizationProvider extends ChangeNotifier {
//   Locale _locale = const Locale('en');
//
//   Locale get locale => _locale;
//
//   void changeLanguage(Locale newLocale) {
//     _locale = newLocale;
//     notifyListeners();
//   }
// }


import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class LocalizationProvider extends ChangeNotifier {
  Locale _locale = const Locale('en'); // Default language is English
  late Box _settingsBox;

  Locale get locale => _locale;

  LocalizationProvider() {
    _initialize();
  }

  Future<void> _initialize() async {
    _settingsBox = await Hive.openBox('settings');
    await _loadSavedLanguage();
  }

  Future<void> _loadSavedLanguage() async {
    String? savedLanguageCode = _settingsBox.get('selected_language');

    if (savedLanguageCode != null && savedLanguageCode != _locale.languageCode) {
      _locale = Locale(savedLanguageCode);
      notifyListeners(); // 🔥 Triggers UI rebuild when app starts
    }
  }

  Future<void> changeLanguage(Locale newLocale) async {
    if (_locale.languageCode != newLocale.languageCode) {
      _locale = newLocale;
      notifyListeners(); // 🔥 Updates UI immediately

      await _settingsBox.put('selected_language', newLocale.languageCode);
    }
  }
}



