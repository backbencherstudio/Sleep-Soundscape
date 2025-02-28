import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:sleep_soundscape/l10n.dart';
import 'dart:ui' show Locale;

class LocalProvider with ChangeNotifier {
  Locale? _locale;
  final Box settingsBox = Hive.box('settings'); 
  LocalProvider() {
    _loadLocale(); 
  }

  Locale? get locale => _locale;

  Future<void> setLocale(Locale locale) async {
    if (!L10n.all.contains(locale)) return;

    _locale = locale;
    await settingsBox.put('locale', locale.languageCode); 
    notifyListeners();
  }

  void clearLocale() async {
    _locale = null;
    await settingsBox.delete('locale'); 
    notifyListeners();
  }

  void _loadLocale() {
    String? langCode = settingsBox.get('locale');
    if (langCode != null) {
      _locale = L10n.all.firstWhere(
        (loc) => loc.languageCode == langCode,
        orElse: () => Locale('en'), 
      );
    }
  }
}
