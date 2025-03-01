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

class LocalizationProvider extends ChangeNotifier {
  Locale _locale = const Locale('en'); // Default language is English

  Locale get locale => _locale;

  LocalizationProvider() {
    _loadSavedLanguage(); // Load language when provider initializes
  }

  Future<void> _loadSavedLanguage() async {
    var box = await Hive.openBox('settings');
    String? savedLanguageCode = box.get('selected_language');

    if (savedLanguageCode != null) {
      _locale = Locale(savedLanguageCode);
      notifyListeners();
    }
  }

  Future<void> changeLanguage(Locale newLocale) async {
    _locale = newLocale;
    notifyListeners();

    // ✅ Save selected language in Hive
    var box = await Hive.openBox('settings');
    await box.put('selected_language', newLocale.languageCode);
  }
}


